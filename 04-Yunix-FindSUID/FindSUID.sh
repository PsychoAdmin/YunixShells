#!/bin/bash

#Thanks go to for the SUID part: http://www.wangproducts.net/article.php?id=33

N=0
find / -type f \( -perm -4000 -o -perm -2000 \) -exec ls {} \; | while read LINE ; do
	N=$((N+1))
	strings $LINE | grep /bin | while read WOAH ; do
		echo "FOUND containing /bin ===> $LINE contains $WOAH"
	done
done

N=0
find / -type f \( -perm -4000 -o -perm -2000 \) -exec ls {} \; | while read LINE ; do
        N=$((N+1))
	echo "SUID FOUND ===> $LINE"
done

