#!/bin/bash
#sed -e 's/<Function .* Name\="\(.*\)" ID\="\(.*\)">//g'

cat test.qxw |grep "<Function" | while read line
do
name=`echo $line|sed -e 's/<Function .* Name\="\(.*\)" .*>/\1/g'`
functionid=`echo $line |sed -e 's/<Function .* ID\="\(.*\)">/\1/g'` #sed -e 's/<Function .* ID\="\(.*\)">/\1/g'`

echo $name" "$functionid

done
