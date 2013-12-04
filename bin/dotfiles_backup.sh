#!/bin/bash

$BIN
tmp=/tmp/dotfiles
mkdir $tmp

function backup() {
	item=$1
	tmp=$2
	if [ -f $item -o -d $item ]; then
		if [ ! -d $tmp ]; then mkdir $tmp; fi
		cp -r $item $tmp
	else
		echo "$item doesn't exist"
	fi
}

#backup sequetially all dotted files without .git backup and bin dir's
ls -al --ignore=".git" | tail -n +2 | grep -v "\.$" | grep -v "backup" | grep -v "bin"  | awk '{print "backup:"$9} {backup "~/"$9 $tmp}'


NOW=$(date +"%Y%m%d%H%M")

back="$tmp-backup"
if [ ! -d "$back" ]; then mkdir "$back"; fi
tar cf "$back/dotfiles-$NOW.tar.gz" $tmp

echo "You can find previous backup dotfiles in $back"
