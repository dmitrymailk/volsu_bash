Лабораторная работа №4

1. Написать скрипт, который выводит на экран список пользователей из файла /etc/passwd и привязанные к ним программы оболочки командной строки. выводить только список пользователей, без дублирования.
```bash
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
```

2. скрипт, который выводит на экран список пользователей, которые входят в хотя бы одну группу, что и пользователь. имя gjkmpjntkz передано как аргумент командной строки.
```bash
#!/bin/bash
# проверяем наличие переданного аргумента
if [ -z "$1" ]; then
	echo "Usage: $0 username"
	exit 1
fi
# проверяем наличие файла
if [ ! -f /etc/passwd ]; then
	echo "File /etc/passwd not found"
	exit 1
fi
# считываем файл построчно
while read line; do
	# разбиваем строку на поля
	IFS=":" read -r -a array <<< "$line"
	# проверяем имя пользователя
	if [ "${array[0]}" = "$1" ]; then
		# получаем список групп пользователя
		groups=$(groups "$1")
		# разбиваем строку на поля
		IFS=" " read -r -a array <<< "$groups"
		# выводим информацию
		echo "User: ${array[0]}"
		echo "Groups: ${array[2]}"
		echo "---"
	fi
done < /etc/passwd
```