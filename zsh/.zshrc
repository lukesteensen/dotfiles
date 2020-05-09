PURS_PATH="$HOME/dev/purs"

function zle-line-init zle-keymap-select {
  PROMPT=`$PURS_PATH/target/release/purs prompt -k "$KEYMAP" -r "$?"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz add-zsh-hook

function _prompt_purs_precmd() {
  $PURS_PATH/target/release/purs precmd
}
add-zsh-hook precmd _prompt_purs_precmd

export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias l='ls -lha'
alias ll='ls -lh'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'

autoload -U compinit
compinit

export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

export WORDCHARS=''

fpath=(/usr/local/share/zsh-completions $fpath)

# https://github.com/sfackler/rust-openssl/issues/255
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
export DEP_OPENSSL_INCLUDE=`brew --prefix openssl`/include

# compiling librdkafka broke after mojave upgrade
# https://github.com/erlio/vernemq/issues/206
export LDFLAGS="-L/usr/local/opt/openssl/lib"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

export FZF_DEFAULT_COMMAND='fd --type f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"
