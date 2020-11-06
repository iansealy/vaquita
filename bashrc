# Set environment variables if not set already
if [[ ! $ENVIRON_SET ]]; then
  . ~/.environ
  . ~/.environ.private
fi

# Check if interactive
[[ $- == *i* ]] || return 0

# History
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=1000000000
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'

# Check window size
shopt -s checkwinsize

# Prompt
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# Functions
if [ -f ~/.functions ]; then
  . ~/.functions
fi
