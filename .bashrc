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


# make and change to a directory
md () { mkdir -p "$1" && cd "$1"; }


# quick plot of numbers on stdin. Can also pass plot params.
# E.G: seq 1000 | sed 's/.*/s(&)/' | bc -l | plot linecolor 2
plot() { { echo 'plot "-"' "$@"; cat; } | gnuplot -persist; }

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

#alias for virtualbox from http://www.virtualbox.org/manual/ch08.html
alias vboxlist='VBoxManage list vms'
alias vboxlistrunning='VBoxManage list runningvms'
alias vboxlistextpacks='VBoxManage list extpacks'
alias vboxstartvm='VBoxManage startvm'
alias vboxstartvmOracle11gR2WD='VBoxManage startvm --type headless 613f3049-63c9-48cb-adda-916467e8f477'
alias vboxstartvmWordpressTurnkey='VBoxManage startvm --type headless 670be74f-74ea-44c4-8a7f-1987a1387550'
alias vboxstartvmBI='VBoxManage startvm --type headless 06627cc9-1bb5-4230-aa93-ddf44f97dc94'

#IP of running vbox's
vboxlistip() { VBoxManage list runningvms | cut -d "{" -f1 | sed "s/\"//g" | 
while read VBOXNAME; 
do IP=$(VBoxManage guestproperty get "$VBOXNAME" /VirtualBox/GuestInfo/Net/0/V4/IP | cut -d":" -f2); 
echo "$VBOXNAME: $IP" 
done; }

streaming TV
RTMPTV="~/workspace/live-greek-tv/media/rtmp_tv.sh"
if [ -f ${RTMPTV} ]; then
	source ${RTMPTV}
fi;


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
export ANT_HOME="$HOME/apps/ant/apache-ant-1.8.4"
export M2_HOME=$HOME/apps/maven/apache-maven-3.1.0
export PATH=$PATH:$M2_HOME/bin:$ANT_HOME/bin

# Load in the git branch prompt script.

GITPROMPT1=~/apps/bash-git-prompt/gitprompt.sh
#GITPROMPT2=~/apps/git-prompt/gitprompt.sh
for GITPROMPT in $GITPROMPT1; do 
if [ -f ${GITPROMPT} ]; then
	source ${GITPROMPT}
fi; done

# Key bindings, up/down arrow searches through history
bind '"\e[A": history-search-backward' #UpArrowKEY
bind '"\e[B": history-search-forward' #DownArrowKEY
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
