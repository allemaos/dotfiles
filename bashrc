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
