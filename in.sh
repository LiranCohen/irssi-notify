#!/bin/bash
die () {
    echo "Usage:"
    echo "$ ./in.sh username@server.address NICK"
    echo ""
    echo >&2 "$@"
    exit 1
}
(( $# >= 2 )) || die "you must enter a user and server address in the form of user@server.net. You must also enter the <nick> you use on IRC."
if [ -z "$1" ];then
	echo "no 1"
fi


IRC_REMOTE=user@remote.server
IRC_NICK=usernick
NICK_ID=${IRC_NICK:0:4}
ssh -o "ConnectTimeout 5" $IRC_REMOTE "tail -n 1 -q -f ~/irclogs/*/#*.log|grep -i --line-buffered $IRC_NICK"| while read line; do
	newline=`echo $line | sed -r 's/<(.*?)>/[\1]/'`;
	GET_NICK=${newline:7:4}; 
	if [ $GET_NICK != $NICK_ID ]; then
       notify-send -t 0 "IRC Mention" "$newline"
    fi          
done