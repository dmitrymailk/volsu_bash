#!/bin/bash
PS3="Select correct file to restore: "
array=$(grep -4 -o ".*$1.*.tar.gz" ~/.removedfiles);
select lng in $array "Quit"
do
	# если строка это архив с файлом, то разархивируем
	if [[ $lng =~ ^.*\.tar\.gz$ ]]; then
		echo "Extracting $lng"
		tar -xzf $lng
		echo "done!"
		break
	fi
	# если строка содержит Quit, то выходим из цикла
	if [[ "$lng" == "Quit" ]]; then
		echo "We're done";
		break
	fi
done