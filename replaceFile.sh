#!/usr/bin/env bash

echo Enter the origin file '<filename.xxx>': 
read file_orig

echo Enter the destination file:
read file_dest

if [ -f "$file_orig" ]
then
    sed 's/(//;s/)//;s/-//;s/\.//;s/ //;s/-//;s/\.//;s/ //;s/,//;s/\"//;s/_//;s/+//' $file_orig > $file_dest
    echo "A new file has been created:" $file_dest
    echo ""
    cat $file_dest
else
	echo "$file_orig not found or not a regular file. Try again!"
    echo ""
fi
