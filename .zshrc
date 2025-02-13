# source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    fzf-tab
    # zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/orlandoromero/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<


export PATH="/Applications/Godot.app/Contents/MacOS:$PATH"


eval "$(zoxide init zsh)"

# Bind Tab to accept autosuggestion
# bindkey '^ ' autosuggest-execute # Ctrl + space to accept autosuggestion
function zp() {
    z "$@" && pwd
}
alias zq='zoxide query'      # Query paths without switching
alias zl='zoxide list'       # List all stored directories
alias icat='viu'

# Created by `pipx` on 2025-01-27 00:13:38
export PATH="$PATH:/Users/orlandoromero/.local/bin"

export PATH="$PATH:/opt/homebrew/Caskroom/miniconda/base/bin"


# Automatically activate most recently activated conda env
source ~/.conda_auto_env.sh

