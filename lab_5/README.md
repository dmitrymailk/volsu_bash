### Лабораторная работа №5
1. Написать скрипт newrm, который будет автоматически архивировать удаляемые файлы в
архив каталог ~/.deleted_files, при этом к имени файла добавляется время его удаления.
При этом он должен записывать информацию об удаленных файлах в файл ~/.removedfiles. (4 балла)
```bash
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
```



2. скрипт для восстановления файлов из каталога ~/.deleted_files по части имени или дате.
```bash
#!/bin/bash
if [ -z "$1" ]; then
	echo "Usage: $0 file"
	exit 1
fi
# -n string is not null, that is, has nonzero length
if [ -n "$(grep -E "$1" ~/.removedfiles)" ]; then
	echo "Found files:"
	grep -E "$1" ~/.removedfiles
	echo "Enter file name:"
	read file
	if [ -f "$file" ]; then
		echo "File $file already exists"
		exit 2
	fi
	tar -xzf "$file" -C .
else
	echo "File not found"
	exit 3
fi
```

