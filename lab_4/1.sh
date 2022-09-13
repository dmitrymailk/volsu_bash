#!/bin/bash
# проверяем наличие файла
if [ ! -f /etc/passwd ]; then
	echo "File /etc/passwd not found"
	exit 1
fi
# считываем файл построчно
while read line; do
	# разбиваем строку на поля
	IFS=":" read -r -a array <<< "$line"
	# выводим информацию
	echo "User: ${array[0]}"
	echo "Shell: ${array[6]}"
	echo "---"
done < /etc/passwd