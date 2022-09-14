#!/bin/bash
echo "Список исполняемых файлов из каталога $1:"
find $1 -maxdepth 1 -type f -executable