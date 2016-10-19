#!/bin/bash
# 만든이 : 강현구(rkdgusrnrlrl@gmail.com)
# 제작일 : 2016-03-01
# 사용방법 : backup {백업할파일명} => 해당 폴더에 해당 파일명 뒤에 날짜가 붙어서 백업됨
# ex : member.db.20160301.back
# 개선 사항
# - 옵션을 통해 백업 폴더 설정 
#
./back_dir.sh | xargs -i ./back_batch.sh -d {} $*
