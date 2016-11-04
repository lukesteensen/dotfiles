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
export PATH="$HOME/.cargo/bin:$PATH"
export DISABLE_AUTO_TITLE=true
export GOPATH="$HOME/dev/gopath"

alias gs='git status'
alias gdc='git diff --cached'

# https://github.com/sfackler/rust-openssl/issues/255
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
