1. скрипт, который определяет имеется ли путь к программе в переменной окружения PATH. Название программы передается через параметры командной строки.
```bash
#!/bin/bash
# провряем наличие переданного аргумента
if [ -z "$1" ]; then
	echo "Usage: $0 program"
	exit 1
fi

IFS=":"
for i in $PATH; do
	echo "Searching in $i";
	# проверяем наличие файла в директории
	if [ -x "$i/$1" ]; then
		echo "$1 is in $i"
		exit 0
	fi
done
echo "$1 is not in PATH"
exit 1
```

2. Написать скрипт, проверяющий корректность путей в переменной PATH.
```bash
#!/bin/bash
IFS=":"
for i in $PATH; do
	# проверяем наличие директории
	if [ ! -d "$i" ]; then
		echo "$i is not a directory"
		exit 1
	fi
done
echo "PATH is correct"
exit 0
```