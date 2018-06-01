#!/bin/bash
source=$1
dest=$2

echo "source is $source"
echo "destination is $dest"
for file in "$source"/*
do 
	echo "$file"
	if [ ! -d  "$dest" ]; then
		mkdir "$dest"
		echo 'diractory $dest has bin made'
	else
		echo 'directory $dest already exist'
	fi
	cp "$file" "$dest/${file##*/}"
	echo 'made file'
	rm "$file"
	echo 'removed file'

done

