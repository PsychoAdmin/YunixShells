#!/bin/bash

N=0
rpm -qa > PackageList.txt
>list.txt
cat PackageList.txt | while read LINE ; do
       N=$((N+1))
       echo "  $LINE" >> list.txt
done

rm PackageList.txt
