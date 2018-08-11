export ZSH="/home/antonio/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    docker
    rvm
    yarn
    python
    tmux
    javascript
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION=true

# Theme options
SPACESHIP_USER_SHOW=true
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_TRUNC=4

# 256 color support
export TERM="xterm-256color"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# Extra tools
export PATH="$PATH:$HOME/.tools/julia/bin"
export PATH="$PATH:$HOME/.tools/yarn/bin"
