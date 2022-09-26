#!/bin/bash
writeTo=".netstatlog";

echo ----AAAAAAAAAAAAAAAAAAAAAAAAAA----- >> $writeTo;
echo "Update time: $(date)" >> $writeTo;
echo "$(netstat -s)" >> $writeTo;