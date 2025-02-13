# Conda setup
export CONDA_BASE="/opt/homebrew/Caskroom/miniconda/base"
source "$CONDA_BASE/etc/profile.d/conda.sh"

export CONDA_LAST_ENV_FILE="$HOME/.conda_last_env"

# Function to track the most recently activated Conda environment
__conda_update_last_env() {
    if [[ -n "$CONDA_PREFIX" ]]; then
        echo "$CONDA_PREFIX" > "$CONDA_LAST_ENV_FILE"
    fi
}

# Function to track when Conda is deactivated
__conda_deactivate_hook() {
    if [[ -z "$CONDA_PREFIX" ]]; then
        echo "DEACTIVATED" > "$CONDA_LAST_ENV_FILE"
    fi
}

# Ensure hooks run only once
if [[ -n "$ZSH_VERSION" ]]; then
    if [[ -z "${precmd_functions[(r)__conda_update_last_env]+1}" ]]; then
        precmd_functions+=(__conda_update_last_env)
    fi
    if [[ -z "${precmd_functions[(r)__conda_deactivate_hook]+1}" ]]; then
        precmd_functions+=(__conda_deactivate_hook)
    fi
elif [[ -n "$BASH_VERSION" ]]; then
    if [[ "$PROMPT_COMMAND" != *"__conda_update_last_env"* ]]; then
        PROMPT_COMMAND="__conda_update_last_env; $PROMPT_COMMAND"
    fi
    if [[ "$PROMPT_COMMAND" != *"__conda_deactivate_hook"* ]]; then
        PROMPT_COMMAND="__conda_deactivate_hook; $PROMPT_COMMAND"
    fi
fi

# Auto-activate the last used Conda environment only if it was not explicitly deactivated
if [[ -f "$CONDA_LAST_ENV_FILE" ]]; then
    LAST_ENV=$(cat "$CONDA_LAST_ENV_FILE")
    if [[ "$LAST_ENV" != "DEACTIVATED" && -d "$LAST_ENV" ]]; then
        source "$CONDA_BASE/bin/activate" "$LAST_ENV"
    fi
fi
