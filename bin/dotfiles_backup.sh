#!/bin/bash

$tmp=/tmp/dotfiles

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

backup ~/.bashrc $tmp
backup ~/.bash_profile $tmp
bsckup ~/.gitconfig $tmp
backup ~/.gitignore_global $tmp
backup ~/.vimrc $tmp
backup ~/.vim/ $tmp
backup ~/bin/ $tmp

NOW=$(date +"%Y-%m-%d-%T")

if [ ! -d backup ]; then mkdir backup; fi
tar cvf ../backup/dotfiles-$NOW.tar.gz $tmp

