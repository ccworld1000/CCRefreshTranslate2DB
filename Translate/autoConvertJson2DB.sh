#!/bin/sh
#
#  Created by dengyouhua on 17/4/26.
#  Copyright © 2017 CC | ccworld1000@gmail.com. All rights reserved.

F="all_translate.cc.txt"
NO=`ls *.json | wc -l`
N=$(expr $NO - 0)

echo "[" > $F

i=1
for f in `ls *.json` 
do
	cat $f >> $F

	if [[ $N -gt 1 ]] && [[ $i -eq $N ]]; then
		echo "finish json handle ..."
	else
		echo "," >> $F
	fi

	((i = i + 1))
done

echo "]" >> $F

chmod 744 CCRefreshTranslate2DB

echo "convert file to db ..."
./CCRefreshTranslate2DB $F

echo "clean temp file ..."
rm -rf CCRefreshTranslate2DB.db-wal CCRefreshTranslate2DB.db-shm $F

echo "finish OK!"
