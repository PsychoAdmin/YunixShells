#!/bin/bash

/usr/bin/updatedb

if [ "$?" == 0 ]; then
	echo "Daily UpdateDB done"
fi
