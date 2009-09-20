#!/bin/bash

N=0

ps -eo "%C,%p,%U" | sort -k 1 -r | grep -v '%CPU,  PID,USER' | grep -v root | grep -v admin | xargs -d ',' | while read LINE ; do
	N=$((N+1))
	CPU=$(echo $LINE | awk '{print $1,$2}' | cut -d ' ' -f 1 | cut -d '.' -f 1)
	PID=$(echo $LINE | awk '{print $1,$2}' | cut -d ' ' -f 2)
	USER=$(echo $LINE | awk '{print $3}')

	if [ -z $CPU ]; then
		exit
	fi

	if [ $CPU -ge 10 ]; then
		/usr/bin/cpulimit -p $(echo $PID | cut -d ' ' -f 2) -l 4 > /dev/null 2>&1 &
#		mail -s "CPU limited on $USER's, $PID taking up $CPU" root ShellPwn@hotmail.com &
	fi
done
