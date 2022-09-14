Лабораторная работа №2

1. Создать скрипт, принимающий в качестве аргумента строку и помещающий эту строку в файл ~/.myevents в формате: текущая дата, время, помещаемая строка. Если параметров нет, то скрипт выводит на экран последние n записей. Число записей по умолчанию равно 7. Если существует файл ~/myevents.conf, то из него извлекается значение n. с объяснением.
```bash
#!/bin/bash
# проверяет наличие файла с конфигурацией
if [ -f ~/myevents.conf ]; then
	# если файл существует, то извлекаем из него число записей
	n=$(cat ~/myevents.conf)
else
	# если файла нет, то используется значение по умолчанию
	n=7
fi

# проверяет наличие аргумента
if [ $# -eq 0 ]; then
	# выводит последние n записей из файла
	tail -n $n ~/myevents
else
	# добавляет запись в файл
	echo "$(date) $1" >> ~/myevents
fi
```

3. Добавить необязательный аргумент – дату, после которой осуществляется вывод соответствующих сообщений из файла ~/.myevents. с использованием grep.
```bash
#!/bin/bash
# проверяет наличие файла с конфигурацией
if [ -f ~/myevents.conf ]; then
	# если файл существует, то извлекаем из него число записей
	n=$(cat ~/myevents.conf)
else
	# если файла нет, то используется значение по умолчанию
	n=7
fi

# проверяет наличие аргумента
if [ $# -eq 0 ]; then
	# выводит последние n записей из файла
	tail -n $n ~/myevents
elif [ $# -eq 1 ]; then
	# добавляет запись в файл
	echo "$(date +"%d.%m.%Y,%H:%M:%S") $1" >> ~/myevents
fi

# вызываю скрипт при наличии аргумента n
while getopts "n:" opt; do
	case $opt in
		n)	
			pattern='s/([0-9]{2}).([0-9]{2}).([0-9]{4}),([0-9]{2}):([0-9]{2}):([0-9]{2})/\3\2\1\4\5\6/';
			resultLines='';
			# считать только первые n строк
			for line in $(head -n $n ~/myevents); do
				line_date="$(echo $line | sed -E "$pattern" | cut -c 1-14)";
				end_date="$(echo ${OPTARG} | sed -E "$pattern" | cut -c 1-14)";
				if [[ "$line_date" -ge "$end_date" ]]; then	
					echo $line;
				fi
			done;


		# 	while read -r line; do
		# 		# line_date=$(date -d $(sed "$pattern" <<< "$line") +%s);
		# 		# end_date=$(date -d $(sed "$pattern" <<< "${OPTARG}") +%s);
		# 		line_date="$(echo $line | sed -E "$pattern" | cut -c 1-14)";
		# 		end_date="$(echo ${OPTARG} | sed -E "$pattern" | cut -c 1-14)";
		# 		if [[ "$line_date" -ge "$end_date" ]]; then	
		# 			echo $line;
		# 		fi
		# done < ~/myevents;
		# 	;;
	esac
done
```


### доделать 2 пункнт



