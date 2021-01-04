# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Custom PS1 :
my_t="[\e[1;33m\t\e[01;37m]"                        # Time
my_u="[\[\e[1;34m\u\e[01;37m\]]"                    # Username
my_h="[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;37m\]]"  # Hostname
my_w="\[\e[01;31m\]\w\[\e[01;37m\]"                 # Working directory
my_n="\[\e[01;31m\]\n\[\e[01;37m\]"                 # Arrow to go to next line
export PS1="\[\e[01;37m\]┌─${my_t}──${my_u}──${my_h}: ${my_w}${my_n}└──\[\e[01;37m\]>> \[\e[0m\]"

# History :
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth  # Ignore duplicates
shopt -s histappend     # Append to file (don't overwrite it)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Clean up home folder :
export PYLINTHOME="$HOME/.config/pylint"
export GNUPGHOME="$HOME/.config/gnupg"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


#--------------------------------------------- ALIASES ---------------------------------------------
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto --group-directories-first'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias progc='cd ~/Documents/cours/ING1/progc-ing1'

# ls aliases :
alias ll='ls -alF'
alias la='ls -A'

# rm aliases :
alias rm='rm -i'

# tar aliases :
alias untar='tar -xvzf'
alias compress='tar -cvzf'
alias rappel='echo compress nomArchive fichiersAArchiver'

# random aliases :
alias forkbomb='echo :\(\)\{ :\|:\& \};:'
alias c='clear'
alias site-c='sudo cytech-site-change cergy'

# openvpn aliases :
alias vpn-off='sudo /etc/init.d/openvpn stop'
alias vpn-on='sudo /etc/init.d/openvpn start'
alias vpn-restart='sudo /etc/init.d/openvpn restart'