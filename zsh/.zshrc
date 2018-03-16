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
