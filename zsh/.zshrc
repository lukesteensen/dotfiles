# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="juanghurtado"

COMPLETION_WAITING_DOTS="true"

plugins=(brew git go heroku postgres)

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $(brew --prefix nvm)/nvm.sh

# zsh-completions
# fpath=(/usr/local/share/zsh-completions $fpath)
fpath=($fpath /usr/local/share/zsh-completions)

export PATH="bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.multirust/toolchains/stable/cargo/bin:$PATH"
export DOCKER_HOST=tcp://localhost:4243

alias gs='git status'
alias gdc='git diff --cached'
