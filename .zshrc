export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git encode64 httpie nmap pip systemd web-search archlinux)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

alias rr="ranger"
alias ll="exa -l"
alias ls="exa -l"
alias l="exa -l -a"
alias tree="exa -l -a --tree"
