# Init
export ZSH="$HOME/dotfiles/zsh"

# Plugins
source $ZSH/antigen.zsh
antigen theme refined
antigen bundle git
antigen bundle command-not-found
antigen bundle cp
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# Exports
export EDITOR='nvim'
export PATH="$PATH:/usr/local/go/bin"
export PATH="/opt/homebrew/bin:$PATH"

# Bindings
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Additional sources
source $ZSH/functions
source $ZSH/aliases

# Style
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
zstyle ':completion:*' menu select
RPROMPT="%F{magenta} %D{%K:%M:%S}"
