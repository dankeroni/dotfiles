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
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
    if [ "$(id -u)" = "0" ]; then
        PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[00;36m\]$(__git_ps1|cut -c 3-|rev|cut -c 2-|rev)\[\033[0m\]\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]\$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;36m\]$(__git_ps1|cut -c 3-|rev|cut -c 2-|rev)\[\033[0m\]\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
else
    PS1='\u@\h:$(__git_ps1|cut -c 2-)\w\$ '
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

if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi

if ! [ -f ~/.git_prompt.sh ]; then
    curl -o ~/.git_prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh &> /dev/null
fi
. ~/.git_prompt.sh

# added by travis gem
[ -f /home/dankeroni/.travis/travis.sh ] && source /home/dankeroni/.travis/travis.sh

shopt -s cdspell
shopt -s direxpand
shopt -s dirspell
shopt -s mailwarn
shopt -s xpg_echo

command -v keychain >/dev/null 2>&1 && eval `keychain --quiet --eval --agents gpg,ssh id_ecdsa 684A3B5959CA84E51CC61E86BBE351DDB0B5B8CF`

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dankeroni/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dankeroni/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dankeroni/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dankeroni/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

