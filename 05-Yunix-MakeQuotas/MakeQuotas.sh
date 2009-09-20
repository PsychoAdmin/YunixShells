#!/bin/bash

N=0
cat /etc/group | grep 501 | cut -d ':' -f 4 | xargs -d ',' | perl -e 'print join "\n", split " " while <>;' | while read LINE; do
       N=$((N+1))
       quotatool -u $LINE -b -q 30000 /dev/simfs
       echo "$LINE quota set"
done

if [ "$?" == 0 ]; then
	echo "Member quotas set."
fi

echo ""

N=0
cat /etc/group | grep 504 | cut -d ':' -f 4 | xargs -d ',' | perl -e 'print join "\n", split " " while <>;' | while read LINE; do
       N=$((N+1))
       quotatool -u $LINE -b -q 100000 /dev/simfs
       echo "$LINE quota set"
done

if [ "$?" == 0 ]; then
        echo "Power Member quotas set."
fi
