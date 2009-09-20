#!/bin/bash

N=0
cat /etc/group | grep 501 | cut -d ':' -f 4 | xargs -d ',' | perl -e 'print join "\n", split " " while <>;' | while read LINE; do
	N=$((N+1))
	echo "$LINE PROCESSES"
	ps -u $LINE
	echo "***************"
done

N=0
cat /etc/group | grep 504 | cut -d ':' -f 4 | xargs -d ',' | perl -e 'print join "\n", split " " while <>;' | while read LINE; do
        N=$((N+1))
        echo "$LINE PROCESSES"
        ps -u $LINE
        echo "***************"
done
