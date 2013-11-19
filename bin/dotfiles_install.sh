#!/bin/bash

echo "BACKUP OLD FILES"
. dotfiles_backup.sh
echo "END OF BACKUP"

echo "INSTALL VIM PLUGINS"
echo "END OF VIM PLUGINS"

echo "LINK NEW FILES"
echo "END OF LINK"

echo "Enjoy, fork and tweak these dotfiles"
