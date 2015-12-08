#!/bin/sh
PATH=".:$PATH" . project.cfg

rm build/ -R >> /dev/null 2>&1
mkdir build/

for asmFile in `find . -type f -name "*.s"`
do
	ca65 $asmFile -o build/`basename -s .s $asmFile`.o
done

rm out/"$LIBRARY_NAME".lib >> /dev/null 2>&1
ar65 a out/"$LIBRARY_NAME".lib `find ./build -type f -name "*.o"`
