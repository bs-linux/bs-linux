# 
#   @===============================================================@
#   |     __                 ___                                    |
#   |    /\ \               /\_ \    __                             |
#   |    \ \ \____    ____  \//\ \  /\_\    ___   __  __  __  _     |
#   |     \ \ '__`\  /',__\   \ \ \ \/\ \ /' _ `\/\ \/\ \/\ \/'\    |
#   |      \ \ \L\ \/\__, `\__ \_\ \_\ \ \/\ \/\ \ \ \_\ \/>  </    |
#   |       \ \_,__/\/\____/\_\/\____\\ \_\ \_\ \_\ \____//\_/\_\   |
#   |        \/___/  \/___/\/_/\/____/ \/_/\/_/\/_/\/___/ \//\/_/   | 
#   |                                                               |
#   @===============================================================@                                                     
#
#
#
#
## Run Neofetch of course!
neofetch

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

## Git aliases
alias gc='sudo git clone'
alias gitbs='cd ~/git/bs-linux'

## Terminal aliases for making flying around the terminal easier and quicker

alias ..='cd ..'
alias c='clear'
alias dl='cd ~/Downloads'
alias cd.='cd ~/.config/'
alias cat='batcat'
alias rebash='source .bashrc'

## Aliases for opening apps using "default" commands

## alias vim='nvim'
alias macs='/usr/bin/emacs --daemon &'
alias ts='sudo timeshift-launcher'

## Giving Micro the best color scheme available! Dracula!

export MICRO_TRUECOLOR=1
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
