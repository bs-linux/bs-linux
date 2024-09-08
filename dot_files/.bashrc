##      ____ _____   __    _
#     / __ ) ___/  / /   (_)___  __  ___  __
#    / __  \__ \  / /   / / __ \/ / / / |/_/
#   / /_/ /__/ / / /___/ / / / / /_/ />  <
#  /_____/____(_)_____/_/_/ /_/\__,_/_/|_|
#
#   Author: Brian Scott
#   Basic .bashrc script

#
## Run FastFetch of course!
fastfetch

## Not So Fancy Shmancy Bash Prompt

PS1='\[\033[36m\]\l\[\033[35m\] => \[\033[34m\]\u\[\033[32m\]@\[\033[36m\]\h \[\033[34m\]\w \[\033[37m\]\$ '

## Aliases broken into categories

## Aliases for opening specific dot files quicker

alias bashrc='micro ~/.bashrc'

## List aliases using LSD aka LS(Deluxe)

alias l='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'

## Distro aliases (eg: Install, Update, etc)
alias install='sudo nala update; sudo nala install'
alias update='sudo nala update; sudo nala upgrade -y; sudo nala autoremove; sudo nala clean'
alias gc='sudo git clone'

## Terminal aliases for making flying around the terminal easier and quicker

alias ..='cd ..'
alias c='clear'
alias dl='cd ~/Downloads'
alias cd.='cd ~/.config/'
alias cat='batcat'
alias rebash='source .bashrc'

## Aliases for opening apps using "default" commands

alias vim='nvim'
alias macs='/usr/bin/emacs --daemon &'

## Giving Micro the best color scheme available! Dracula!

export MICRO_TRUECOLOR=1
export PATH="$HOME/.config/emacs/bin:$PATH"
