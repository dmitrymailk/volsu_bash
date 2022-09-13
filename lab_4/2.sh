#!/bin/bash
# проверяем наличие переданного аргумента
if [ -z "$1" ]; then
	echo "Usage: $0 user"
	exit 1
fi
# получаем список групп, в которых состоит пользователь и удалить из них пользователя
groups=`groups $1 | sed "s/$1 : //"`
IFS=" "
for i in $groups; do
	# получаем список пользователей, входящих в группу
	users=`getent group $i | cut -d: -f4 | tr ',' ' '`
	for j in $users; do
		if [ "$j" != "$1" ]; then
			echo "$j is in $i"
		fi
	done
done