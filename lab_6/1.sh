#!/bin/bash
if [ -n "$1" ]; then
  pkill -15 "$1";
  echo "Process $1 killed";
fi