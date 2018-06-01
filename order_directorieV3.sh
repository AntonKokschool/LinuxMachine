#!/bin/bash
source=$1
dest=$2
soort=$3
echo "source is $source"
echo "destination is $dest"
echo "type is $type"
if [ "$soort" == "maand" ]; then
	echo 'maand##########################################################'
	type='%m'
elif [ "$soort" == "week" ]; then
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
	filedatum=$(date -r $file +$type)
	echo "$filedatum is dit111111111111111111111111111111111111111111111111111"
	#cp "$file" "$dest/$soort$filedatum/${file##*/}"
	echo "$file" + "$dest/$soort$filedatum/${file##*/}"
	echo "${file##*/}" #filename  only
	echo 'made file'
	#rm "$file"
	echo 'removed file'
	echo '#################################'
done
