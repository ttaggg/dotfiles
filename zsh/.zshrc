
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


__conda_setup="$('/Users/oleg/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/oleg/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/oleg/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/oleg/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Spark
export SPARK_HOME=/opt/homebrew/Cellar/apache-spark/libexec
export PYTHONPATH=/opt/homebrew/Cellar/apache-spark/libexec/python/:$PYTHONP$
#export PATH="/opt/homebrew/opt/scala@2.12/bin:$PATH"
#export PATH="/opt/homebrew/opt/scala@2.13/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oleg/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oleg/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oleg/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oleg/google-cloud-sdk/completion.zsh.inc'; fi
