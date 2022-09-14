#!/bin/bash
# провряем наличие переданного аргумента
if [ -z "$1" ]; then
	echo "Usage: $0 program"
	exit 1
fi

IFS=":"
for i in $PATH; do
	# echo "Searching in $i";
	# проверяем наличие файла в директории
	if [ -x "$i/$1" ]; then
		echo "$1 is in $i"
		exit 0
	fi
done
echo "$1 is not in PATH"
exit 1