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



