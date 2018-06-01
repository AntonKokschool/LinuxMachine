x#!/bin/bash
source=$1
dest=$2
type=$3
echo "source is $source"
echo "destination is $dest"
echo "type is $type"
if [ "$type" == "maand" ]; then
	echo 'maand##########################################################'
	type='%m'
elif [ "$type" == "week" ]; then
	echo 'week##########################################################'
	type='%V'
else
	echo 'none##########################################################'
	exit 1
fi
for file in "$source"/*
do 
	echo "$file"
	if [ ! -d  "$dest" ]; then
		mkdir "$dest"
		echo "diractory $dest has bin made";
	else
		echo "directory $dest already exist";
	fi
	date -r "$file" +"$type"
	#cp "$file" "$dest/${file##*/}"
	echo "$file" + "$dest/${file##*/}"
	echo 'made file'
	#rm "$file"
	echo 'removed file'
	echo '#################################'
done
