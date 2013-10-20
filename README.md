irssi-notify
============

Get local notification in linux from your remote irssi session

I log onto IRC using Irssi on a remote server always running in screen.
This is a little tool I used to get get notified if my nick is mentioned or I recieve a PM.

Still BUGGY, needs a lot of work.


FILES
--------------

Alpha v0.0.1

in.sh:
	This file sends you a notification anytime your nickname is mentioned within a channel.  You will recieve this notification whether you're active or not. The notification title will be "IRC Mention".

in_pm.sh
	This file sends you a notification anytime you recieve a Privte Message from anyone. Currently you will not recieve a notification if you were active on IRC within the last 3 minutes.



GETTING STARTED
---------------

IMPORTANT!
You MUST have an SSH Authentication key set up for the remote server.  This is essential for the script to connect without entering a password.

Visit this link for help: http://www.linuxproblem.org/art_9.html

Step 1:
	Edit in.sh and in_pm.sh and update the following information:
		IRC_REMOTE=user@remote.server (remote server goes here)
		IRC_NICK=usernick (IRC username you usually use goes here)

Step 2:
	Run ./in.sh and(or) ./in_pm.sh 


BONUS
--------------

Use node.js and forever to make this a persistant connection, that way it will always reconnect to check for notifications once connection is made available again.

Instructions for this coming soon.
