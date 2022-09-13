#!/bin/bash
IFS=":"
PATH="$PATH:incorrect_dir"
for i in $PATH; do
	# проверяем наличие директории
	if [ ! -d "$i" ]; then
		echo "$i is not a directory - PATH is incorrect"
		exit 1
	fi
done
echo "PATH is correct"
exit 0