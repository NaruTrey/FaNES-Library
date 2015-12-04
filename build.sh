#!/bin/sh
LIBRARY_NAME="FaNES"

rm build/* >> /dev/null
for asmFile in `find . -type f -name "*.s"`
do
	ca65 $asmFile -o build/`basename -s .s $asmFile`.o
done

rm out/"$LIBRARY_NAME".lib
ar65 a out/"$LIBRARY_NAME".lib `find ./build -type f -name "*.o"`
