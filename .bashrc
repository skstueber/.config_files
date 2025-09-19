# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GTK_DEBUG=interactive

export PATH=/opt/idea-IU-251.25410.129/bin:$PATH
export PATH=/opt/pycharm-2025.1.1/bin:$PATH
export PATH=/opt/clion-2025.1.1/bin:$PATH
export PATH=/home/skstueber/.cargo/bin:$PATH
export PATH=/home/skstueber/.local/share/chocolate-doom:$PATH

export EDITOR="/usr/bin/vim"

PS1="\[\033[01;35m\]\w\[\033[01;32m\]> \[\033[0m\]"

xdotool key Ctrl+plus

LS_COLORS=$LS_COLORS:'di=1;36:ex=1;91:*avif=01;33:*.jpg=01;33:*.jpeg=01;33:*.mjpg=01;33:*.mjpeg=01;33:*.gif=01;33:*.bmp=01;33:*.pbm=01;33:*.pgm=01;33:*.ppm=01;33:*.tga=01;33:*.xbm=01;33:*.xpm=01;33:*.tif=01;33:*.tiff=01;33:*.png=01;33:*.svg=01;33:*.svgz=01;33:*.mng=01;33:*.pcx=01;33:*.mov=01;33:*.mpg=01;33:*.mpeg=01;33:*.m2v=01;33:*.mkv=01;33:*.webm=01;33:*.webp=01;33:*.ogm=01;33:*.mp4=01;33:*.m4v=01;33:*.mp4v=01;33:*.vob=01;33:*.qt=01;33:*.nuv=01;33:*.wmv=01;33:*.asf=01;33:*.rm=01;33:*.rmvb=01;33:*.flc=01;33:*.avi=01;33:*.fli=01;33:*.flv=01;33:*.gl=01;33:*.dl=01;33:*.xcf=01;33:*.xwd=01;33:*.yuv=01;33:*.cgm=01;33:*.emf=01;33:*.ogv=01;33:*.ogx=01;33:*.c=0;92:*.py=0;92:*.h=0;93:*.tex=0;33:*.pdf=0;37:*.docx=0;37:*.txt=0;37:*.odt=0;37:' ; export LS_COLORS

### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


# ls upgrade
alias ls='eza --color=always --group-directories-first'
alias l.='eza --color=always --group-directories-first ../'
alias l..='eza --color=always --group-directories-first ../../'
alias l...='eza --color=always --group-directories-first ../../../'

alias ll='eza -l --color=always --group-directories-first'
alias ll.='eza -l --color=always --group-directories-first ../'
alias ll..='eza -l --color=always --group-directories-first ../../'
alias ll...='eza -l --color=always --group-directories-first ../../../'

alias lT='eza -T --color=always --group-directories-first'

alias lal='eza -al --color=always --group-directories-first'
alias lal.='eza -al --color=always --group-directories-first ../'
alias lal..='eza -al --color=always --group-directories-first ../../'
alias lal...='eza -al --color=always --group-directories-first ../../../'

alias lf='eza -f --color=always --group-directories-first' 
alias lf.='eza -f --color=always --group-directories-first ../' 
alias lf..='eza -f --color=always --group-directories-first ../../' 
alias lf...='eza -f --color=always --group-directories-first ../../../' 

alias ld='eza -D --color=always --group-directories-first' 
alias ld.='eza -D --color=always --group-directories-first ../' 
alias ld..='eza -D --color=always --group-directories-first ../../' 
alias ld...='eza -D --color=always --group-directories-first ../../../' 


# apt shortcuts
alias updg='sudo apt update && sudo apt upgrade'
alias upd='sudo apt update'
alias upg='sudo apt upgrade'
alias aremove='sudo apt autoremove'
alias remove='sudo apt remove'
alias purge='sudo apt purge'
alias install='sudo apt install'


# common flags
alias free='free -m'


# git shortcuts
alias add='git add'
alias branch='git branch'
alias clone='git clone'
alias commit='git commit -m'
alias commita='git commit -a'
alias pullo='git pull origin'
alias pullu='git pull upstream'
alias push='git push'
alias stat='git status'
alias crb='git checkout -b'
alias check='git checkout'


# xclip shortcut
alias xclip='xclip -sel clip'


# doom shortcuts
alias cdoom='cd ~/.local/share/chocolate-doom'
alias doom1='chocolate-doom -iwad ~/.local/share/chocolate-doom/DOOM.WAD'
alias doom1s0='chocolate-doom -iwad ~/.local/share/chocolate-doom/DOOM.WAD -loadgame 0'
alias doom1s='chocolate-doom -iwad ~/.local/share/chocolate-doom/DOOM.WAD -loadgame'


# fastfetch setup
alias ff='fastfetch --logo ~/.config/fastfetch/ascii_logo.txt --logo-color-1 blue --logo-padding-left 2 --logo-padding-top 1'


# Bluetooth setup
alias bt='bluetoothctl'


# Nvim shortcut
alias v='nvim'


# Wifi setup
alias wifion='nmcli r wifi on'
alias wifioff='nmcli r wifi off'
alias wifil='nmcli d wifi list'
alias wific='nmcli d wifi connect'


# Code setup
alias c='clang -Wall -v'
alias m='sudo make'
