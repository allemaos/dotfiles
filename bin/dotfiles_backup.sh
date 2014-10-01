#!/bin/bash

NOW=$(date +"%Y%m%d%H%M")
tmp=/tmp/dotfiles
mkdir $tmp

#backup sequetially all dotted files without .git backup and bin dir's
#ls -al --ignore=".git" | tail -n +2 | grep -v "\.$" | grep -v "backup" | grep -v "bin"  | awk '{print "backup:"$9} {backup "~/"$9 $tmp}'
ls -al --ignore=".git" | tail -n +2 | grep -v "\.$" | grep -v "backup" | grep -v "bin"  | awk '{print $NF}' | xargs -I{} cp ~/{} $tmp

back="./backup"
if [ ! -d "$back" ]; then mkdir "$back"; fi
tar -cf "$back/dotfiles-$NOW.tar.gz" $tmp
#rm -rf $tmp


echo "You can find previous backup dotfiles in $back"
