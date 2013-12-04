# .bashrc

#######################################
# change app defaults
# Note one can disable an alias for a
# command by running like \command
#######################################

# Don't store duplicate adjacent items in the history
HISTCONTROL=ignoreboth

alias head='head -n $((${LINES:-12}-2))' #as many as possible without scrolling
alias tail='tail -n $((${LINES:-12}-2)) -s.1' #Likewise, also more responsive -f

# Tell less not to beep and also display colours
export LESS="-QR"

# Let me have core dumps
ulimit -c unlimited

#I hate sound too
set bell-style visible

# User specific aliases and functions 
alias ..="cd .."        #go to parent dir
alias ...="cd ../.."    #go to grandparent dir
alias -- -="cd -"       #go to previous dir
alias l.='ls -d .*'     #list hidden files
alias ll='ls -lhrt'     #extra info compared to "l"
alias lld='ls -lUd */'  #list directories


# what most people want from od (hexdump)
alias hd='od -Ax -tx1z -v'

# canonicalize path (including resolving symlinks)
alias realpath='readlink -f'

#More alais n functions
alias x='exit'
alias www='cd /var/www/html'
alias dur='du -hsx * | sort -rh | head -10'
alias duh='du -a ~ | sort -n -r | head -n 10'
alias update='. ~/.bashrc'
alias update-scan='freshclam & clamscan -ir --stdout --bell ~/'
alias update-fullscan='freshclam & clamscan -ir --stdout --bell /'
alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
alias java-alternative='sudo alternatives --config java ; source .bashrc'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --date=relative --color'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions
export SCRIPTS_HOME=/home/geand/scripts
export PATH=$PATH:$SCRIPTS_HOME 

export KERN_DIR=/usr/src/kernels/`uname -r`
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
#oracle11.2
#InstantClient=/usr/lib/oracle/11.2/client64/lib
#oracle12.1
InstantClient=/usr/lib/oracle/12.1/client64/lib
export LD_LIBRARY_PATH=$InstantClient:${LD_LIBRARY_PATH}
#
export SQLPATH=$InstantClient:${SQLPATH}
export PATH=/usr/bin:${PATH}
#export NLS_LANG=AMERICAN_AMERICA.UTF8
export NLS_LANG=AMERICAN_AMERICA.EL8ISO8859P7
export NLS_LANGUAGE=GREEK
#export MW_HOME=/home/geand/Oracle/
echo '/usr/java/jdk1.7.0_25/' ~/.sqldeveloper/jdk
export PATH=$PATH:$JAVA_HOME/bin
#export ANT_HOME="$HOME/apps/ant/apache-ant-1.8.4"
export M2_HOME=$HOME/apps/maven/apache-maven-3.1.0
export PATH=$PATH:$M2_HOME/bin:$ANT_HOME/bin



