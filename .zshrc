# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
CONFIG_DIR="$(dirname $(readlink ~/.zshrc))"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$CONFIG_DIR/omz"
# Custom zsh theme
ZSH_THEME="bobert"

# unintrusive update behaviour
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# enable command auto-correction.
ENABLE_CORRECTION="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# command execution time stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

##################
# APPLICATIONS
##################
## BREW ##
export HOMEBREW_NO_AUTO_UPDATE=1
