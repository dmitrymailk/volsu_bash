#!/bin/bash
if [ -f ~/myevents.conf ]; then
	n=$(cat ~/myevents.conf)
else
	n=7
fi
if [ $# -eq 0 ]; then
	tail -n $n ~/myevents
else
	echo "$(date) $1" >> ~/myevents
fi