#!/bin/bash

# Script to find the unused labels
# in a laravel project
# @author: Arsan Gamal

# init labels array
labels=()

# file of labels to read from
file="labels.txt"

# unused labels
output="unused.txt"

# laravel project to search
project=""

# loop through file to populate
# the labels array
while IFS= read -r line; do
	labels+=("$line");
done < $file

for label in "${labels[@]}"
do
	echo "Searching for $label";
	if ! grep -q -r  "$label" $project; then
		echo "$label" >> $output;
	fi
done

echo "Done successfully";
