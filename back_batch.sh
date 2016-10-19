#!/bin/bash

## 도움말 출력하는 함수
help() {
    echo "splt [OPTIONS] FILE"
    echo "    -h         도움말 출력."
    echo "    -d ARG     인자를 받는 opt."
    exit 0
}

while getopts "d:h" opt
do
    case $opt in
        d) arg_d=$OPTARG
          BACK_DIR=$arg_d
          ;;
        h) help ;;
        ?) help ;;
    esac
done
 
# getopt 부분 끝나고 난 후의 인자(FILE) 읽기
shift $(( $OPTIND - 1))

if [ -d $BACK_DIR ]
then
	echo "백업파일이 존재합니다."
else
	echo "백업파일이 존재하지 않습니다."
	exit 1
fi

LOG_FILE="$BACK_DIR/log"

#배치 처리
for i in "$@"
do
	if [ -d $i -o -f $i ]
	then
		cp -p -r $i $BACK_DIR >> $LOG_FILE 2>&1
		if [ $? -eq 0 ]
		then
			echo "$i 백업에 성공하였습니다" >> $LOG_FILE
		else
			echo "$i 백업에 실패하였습니다" >> $LOG_FILE
		fi
	else
		echo "해당 파일 혹은 디렉토리($i)가 존재하지 않습니다." >> $LOG_FILE
		exit 1
	fi
done
