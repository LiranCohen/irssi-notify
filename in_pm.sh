#!/bin/bash
IRC_REMOTE=user@remote.server
IRC_NICK=usernick
NICK_ID=${IRC_NICK:0:4}
ssh -o "ConnectTimeout 5" $IRC_REMOTE "find ~/irclogs/*/* -name '*.log' ! -name '#*.log' -print0 | xargs -0 tail -n 1 -q -f" | while read line; do
	newline=`echo $line | sed -r 's/<(.*?)>/[\1]/'`;
	GET_NICK=${newline:7:4}; 
	THIS_HR=${newline:0:2}
	THIS_MIN=${newline:3:2}
	if [ $GET_NICK == $NICK_ID ];then
		LAST_HR=$THIS_HR
		LAST_MIN=$((10#$THIS_MIN + 2))
	fi

	if [ $GET_NICK != $NICK_ID ];then
		if [ -z "$LAST_HR" ];then
			notify-send -t 0 "NEW PM" "$newline"
		elif [[ $THIS_HR > $LAST_HR ]];then
      	 		notify-send -t 0 "NEW PM" "$newline" 
    	elif [[ $THIS_MIN > $LAST_MIN ]];then
    		notify-send -t 0 "NEW PM" "$newline"
    	fi
    fi          
done