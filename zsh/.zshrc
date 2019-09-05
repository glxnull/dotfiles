export ZSH="/home/antonio/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

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
POWERLEVEL9K_MODE="nerdfont-complete"

# Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{white}%k"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b1'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b2'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b7'

# Elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv rbenv nvm)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs battery)

source $HOME/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

# 256 color support
export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM="screen-256color"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"

# Extra tools
export PATH="$PATH:$HOME/.tools/yarn/bin:$HOME/.rbenv/shims"
export PATH="$PATH:$HOME/.tools/cquery/bin"
