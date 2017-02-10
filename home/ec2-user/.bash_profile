# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
VISUAL=/usr/bin/nano
EDITOR="$VISUAL"

export PATH
export VISUAL
export EDITOR
