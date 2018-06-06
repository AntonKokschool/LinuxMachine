#!/bin/bash
source=$1
dest=$2
type=$3
dest=$dest
echo "source is $source"
echo "destination is $dest"
echo "type is $type"
if [ "$type" == "maand" ]; then
	echo 'maand'
	typedate='%m'
elif [ "$type" == "week" ]; then
	echo 'week'
	typedate='%V'
else
	echo 'none'
	exit 1
fi
for file in "$source"/*
do 
	filedatum=$(date -r $file +$typedate)
	if [ ! -d  "$dest" ]; then
		mkdir "$dest"
		echo "diractory $dest has bin made";
	fi
	if [ ! -d  "$dest/$type/" ]; then
		mkdir "$dest/$type"
		echo "diractory $dest/$type has bin made";
	fi
	if [ ! -d  "$dest/$type/$filedatum" ]; then
		mkdir "$dest/$type/$filedatum"
		echo "diractory $dest/$type/$filedatum has bin made";
	else
		echo "directory $dest/$type/$filedatum already exist";
	fi
	cp "$file" "$dest/$type/$filedatum/${file##*/}"
	echo "made file $file" + "$dest/$type/$filedatum/${file##*/}"
	if [ $(md5sum "$dest/$type/$filedatum/${file##*/}" | cut -d " " -f1) == $(md5sum "$file" | cut -d " " -f1)  ]; then
		rm "$file"
		echo 'gelijk en removed file'
	else
		echo 'niet gelijk'
	fi
	echo '#################################'
done
