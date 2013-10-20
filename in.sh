#!/bin/bash
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