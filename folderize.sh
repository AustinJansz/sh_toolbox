#!/bin/bash
# Simple help message for use when learning how to use the tool
if [ "$1" == '-h' ]; then
	echo './folderize.sh FILE_EXTENSION'
	exit 0
fi

# Get files of a given type
for file in *."$1"
do
	# Replace any spaces or hiphens withs with underscores
	# Personal preference
	file_name="$(echo "$file" | sed -e 's/ /_/g' | sed -e 's/\-/_/g')"
	# Define the directory name where the file will now be stored
	dir_name="$(echo "$file_name" | cut -d. -f1)"
	# Test commands
	mkdir "$dir_name"
	mv "$file" "$dir_name/$file_name"
done