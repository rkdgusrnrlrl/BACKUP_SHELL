#!/bin/bash
PWD=$(pwd)

BACK_DIR=$(date +%Y%m%d)
INDEX=0 
while [ -d  "$PWD/back/$BACK_DIR$INDEX" ]  
do
	let "INDEX+=1"
done

mkdir  "$PWD/back/$BACK_DIR$INDEX"
echo  "$PWD/back/$BACK_DIR$INDEX"
