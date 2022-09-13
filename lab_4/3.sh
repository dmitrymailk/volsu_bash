#!/bin/bash
userName=$1;
directory=$2;

# проверяет что переменные не пустые
if [[ -n "$userName" && -n "$directory" ]]; then
  su "$userName" -c "du -hs $directory"
else
  echo "incorrect agruments";
fi