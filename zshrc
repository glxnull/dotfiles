export ZSH="/home/antonio/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    docker
    rvm
    yarn
    python
    tmux
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# 256 color support
export TERM="xterm-256color" 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Add RVM to PATH for scripting. 
export PATH="$PATH:$HOME/.rvm/bin"

# Tools
export PATH="$PATH:$HOME/.tools/yarn/bin:$HOME/.tools/robo3t/bin"
export PATH="$PATH:$HOME/.tools/julia/bin"
export PATH="$PATH:$HOME/.tools/ngrok"

# Go enviroment
export GOROOT="$HOME/.tools/go"
export GOPATH="$HOME/Development/Go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Android dev
export ANDROID_HOME="$HOME/.tools/android-sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/.tools/flutter/bin"
