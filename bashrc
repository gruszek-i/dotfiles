# If not running interactively, don't do anything
[[ -n $PS1 ]] || return

bind 'set show-all-if-ambiguous on' # immediately list matchces instead of ringing the bell
bind 'TAB:menu-complete'            # display list of completions in next line
bind 'set mark-symlinked-directories on' # If a tab-completed file is a symlink to a directory, treat it like a directory not a file
bind 'set colored-stats on'             # colored ls etc.


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

alias nv='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ll='ls -la'
alias clip='wl-copy'
alias trd="tr -d '[:space:]'" # delete all whitespaces from a file

# kubectl
alias k='kubectl'
complete -F __start_kubectl k

# flux
. <(flux completion bash)

# modified prompt from https://github.com/riobard/bash-powerline?tab=readme-ov-file
source ~/.bash-powerline.sh

export EDITOR='nvim'
export XDG_PICTURES_DIR='~/Pictures'

# atuin
. "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"

eval "$(uv generate-shell-completion bash)"

export PATH="$HOME/.local/bin:$PATH"
