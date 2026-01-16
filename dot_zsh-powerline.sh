#!/usr/bin/env zsh

# modified prompt from https://github.com/riobard/bash-powerline?tab=readme-ov-file

autoload -Uz vcs_info

# zsh prompt expansion
setopt PROMPT_SUBST

# git info (native)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %b%u%c'
zstyle ':vcs_info:git:*' actionformats ' %b|%a%u%c'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '*'

precmd() { vcs_info }

# Colors
autoload -Uz colors && colors
COLOR_CWD='%F{blue}'
COLOR_GIT='%F{cyan}'
COLOR_SUCCESS='%F{green}'
COLOR_FAILURE='%F{red}'
COLOR_VENV='%F{15}'
COLOR_RESET='%f%k'

PS_SYMBOL='$'

# venv
venv() { [[ -n $VIRTUAL_ENV ]] && print -n "${COLOR_VENV}($(basename $VIRTUAL_ENV)) ${COLOR_RESET}"; }

PROMPT='$(venv)%F{cyan}%n@%m%f %F{blue}%~%f%F{cyan}${vcs_info_msg_0_}%f%(?.${COLOR_SUCCESS} ${PS_SYMBOL} ${COLOR_RESET}.${COLOR_FAILURE} ${PS_SYMBOL} ${COLOR_RESET})'
