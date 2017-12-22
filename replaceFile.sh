#!/usr/bin/env bash

echo Enter the origin file '<filename.xxx>': 
read file_orig

echo Enter the destination file:
read file_dest

if [ -f "$file_orig" ]
then
    sed 's/(//g;s/)//g;s/-//g;s/\.//g;s/ //g;s/,//g;s/\"//g;s/_//g;s/+//g;s/;//g;s/\r//g;s/\n//g;s/\r\n//g;s/[^0-9]*//g;s/[[:blank:]]//g;s/^[1]//g;s/\s+//g;/^$/d' $file_orig > $file_dest
    echo "A new file has been created:" $file_dest
    echo ""
    cat $file_dest
else
	echo "$file_orig not found or not a regular file. Try again!"
    echo ""
fi
