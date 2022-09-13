Лабораторная работа №1
made by copilot.

Создать скрипты, которые:
a. выводят на экран приветствие «Здравствуйте, имя_пользователя».(1 балл)
```bash
#!/bin/bash
echo "Здравствуйте, $USER"
```
b. выводят на экран число строк и число слов в текстовом файле, название которого передано в командной строке.(1 балл)
```bash
#!/bin/bash
echo "Количество строк в файле $1: $(wc -l $1)"
echo "Количество слов в файле $1: $(wc -w $1)"
```
c. список процессов, запущенных от имени текущего пользователя.(1 балл)
```bash
#!/bin/bash
ps -u $USER
```
d. выводит на экран список и количество переданных аргументов.(1 балл)
```bash
#!/bin/bash
echo "Количество аргументов: $#"
echo "Список аргументов: $@"
```
e. выводит на экран список исполняемых файлов из заданного каталога, название
которого передается в качестве аргумента командной строки.(1 балл)
```bash
#!/bin/bash
echo "Список исполняемых файлов из каталога $1:"
ls -l $1 | grep -e '^-' | awk '{print $9}'
```

f. находит все файлы с заданным расширением, время модификаций к которым ограничено заданным количеством дней и выводит названия этих файлов на экран. предусмотреть обработку ошибок
```bash
#!/bin/bash
echo "Список файлов с расширением $1, время модификации которых не превышает $2 дней:"
find . -name "*.$1" -mtime -$2
```


объясни что делает данная команда ls -l $1 | grep -e '^-' | awk '{print $9}' и почему в скрипте e. используется именно она

ls -l $1 - выводит список файлов в каталоге $1 с дополнительной информацией

grep -e '^-' - выводит только файлы (т.е. строки, начинающиеся с '-')

awk '{print $9}' - выводит 9-ое поле каждой строки (т.е. название файла)

объясни что делает данная команда find . -name "*.$1" -mtime -$2

find . -name "*.$1" - ищет файлы с расширением $1 в текущем каталоге

-mtime -$2 - выводит только файлы, время модификации которых не превышает $2 дней