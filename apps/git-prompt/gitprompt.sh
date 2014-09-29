#helpers functions
get_dir() {
    printf "%s" $(pwd | sed "s:$HOME:~:")
}
get_sha() {
    git rev-parse --short HEAD 2>/dev/null
}


# Colors
Black="$(tput setaf 0)"
BlackBG="$(tput setab 0)"
DarkGrey="$(tput bold ; tput setaf 0)"
LightGrey="$(tput setaf 7)"
LightGreyBG="$(tput setab 7)"
White="$(tput bold ; tput setaf 7)"
Red="$(tput setaf 1)"
RedBG="$(tput setab 1)"
LightRed="$(tput bold ; tput setaf 1)"
Green="$(tput setaf 2)"
GreenBG="$(tput setab 2)"
LightGreen="$(tput bold ; tput setaf 2)"
Brown="$(tput setaf 3)"
BrownBG="$(tput setab 3)"
Yellow="$(tput bold ; tput setaf 3)"
Blue="$(tput setaf 4)"
BlueBG="$(tput setab 4)"
LightBlue="$(tput bold ; tput setaf 4)"
Purple="$(tput setaf 5)"
PurpleBG="$(tput setab 5)"
Pink="$(tput bold ; tput setaf 5)"
Cyan="$(tput setaf 6)"
CyanBG="$(tput setab 6)"
LightCyan="$(tput bold ; tput setaf 6)"
NC="$(tput sgr0)" # No Color

#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u@\h:\[$YELLOW\]\[$YELLOW\]\w \[\033[m\]\[$MAGENTA\]\W$(__git_ps1 ' [%s $(get_sha)] ')\[$WHITE\]\$ "
export PS1='\[$Blue\]\u@\h:\[$Yellow\]\[$Yellow\]\[$Red\]\W$(__git_ps1 " \[$Pink\][%s $(get_sha)] ")\[$White\]\$ '

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
#GIT_PS1_SHOWCOLORHINTS=
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"
#GIT_PS1_SHOWUPSTREAM="verbose name"
