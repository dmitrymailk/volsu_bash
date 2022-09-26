#!/bin/bash
# -z string is null, that is, has zero length
if [ -z "$1" ]; then
	echo "Usage: $0 file"
	exit 1
fi
# -f file is true if file exists and is a regular file
if [ ! -f "$1" ]; then
	echo "File $1 not found"
	exit 2
fi
# -d file is true if file exists and is a directory
if [ ! -d ~/.deleted_files ]; then
	mkdir ~/.deleted_files
fi
if [ ! -f ~/.removedfiles ]; then
	touch ~/.removedfiles
fi
# архивация файла
dat="$(date +"%d.%m.%Y,%H:%M:%S")"
tar -czf ~/.deleted_files/"$1__$dat".tar.gz "$1"
echo ~/.deleted_files/"$1__$dat".tar.gz >> ~/.removedfiles
rm $1