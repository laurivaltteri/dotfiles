# configure oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' frequency 7
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git brew docker)

# add homebrewed binaries and auto completion
eval "$(/opt/homebrew/bin/brew shellenv)"
#autoload -Uz compinit
#compinit

# activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

# use starship prompt
eval "$(starship init zsh)"

# setup pyenv
eval "$(pyenv init -)"

# set aliases
alias dir='ls -lah'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias lock='pmset displaysleepnow'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'

# copilot alias
alias copilot='gh copilot'

# PG client link
#export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

