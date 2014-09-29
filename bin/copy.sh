#!/bin/bash

# This is a filtered copy script for files and directories 
# arguments
# $1 is the source directory
# $2 is the destination directory 
# $3 is the echoed name of the running script

src=$1
des=$2
prompt=$3

#mkdir $tmp

function my_copy() {
	item=$1
	tmp=$2

	echo $1
	if [ -f $item -o -d $item ]; then
		if [ ! -d $tmp ]; then mkdir $tmp; fi
		cp -r $item $tmp
	else
		echo "$item doesn't exist"
	fi
}
echo "SRC: "$src
echo "DES: "$des
echo "prompt: " $prompt
#backup sequetially all dotted files without .git backup and bin dir's
ls -al --ignore=".git" | tail -n +2 | grep -v "\.$" | grep -v "backup" | grep -v "bin"  | awk '{print "$prompt:"$9} {my_copy "$src:$9" $des}'

