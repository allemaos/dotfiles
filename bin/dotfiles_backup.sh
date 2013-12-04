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

ls -al --ignore=".git" | tail -n +2 | grep -v "\.$" | grep -v "backup" | grep -v "bin"  | awk '{print "backup:"$9} {backup "~/"$9 $tmp}'

#backup ~/.bashrc $tmp
#backup ~/.bash_profile $tmp
#backup ~/.gitconfig $tmp
#backup ~/.gitignore_global $tmp
#backup ~/.vimrc $tmp
#backup ~/.vim/ $tmp
#backup ~/bin/ $tmp


NOW=$(date +"%Y%m%d%H%M")

back="$tmp-backup"
if [ ! -d "$back" ]; then mkdir "$back"; fi
tar cf "$back/dotfiles-$NOW.tar.gz" $tmp

echo "You can find previous backup dotfiles in $back"
