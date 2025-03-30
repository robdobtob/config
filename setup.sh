#!/bin/sh
# Script to install, organise and configure base setup.
# Why did i write this?
# I had time, and was in the process of setting up a new laptop. The perfect opportunity for writing 'onboarding docs'. Will it be maintained when I install new things? who knows.
# Most is also untested because ive already run the setup and installation first :\
#
# Application config is managed by creating symbolic links to files in this repo in an attempt to keep them up to date.

# get directory config repo was cloned into
CONFIG_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# top level zsh config which points applications to use this config files in this repo

# Install dependencies/applications and migrate config
# util to check if application is installed
not_installed() {
  if hash $1 2>/dev/null; then
    return 1
  else 
    return 0
  fi
}

# brew
if not_installed brew; then
  NONINTERAVTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# oh my zsh
# checking install artifacts because its all 'sourced' into the shell rather than a binary.
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
ln -fs $CONFIG_DIR/.zshrc ~/.zshrc

# Vim
ln -fs $CONFIG_DIR/.vimrc ~/.vimrc
# symlink entire vim directory so can propagate plugins
ln -fs $CONFIG_DIR/vim ~/.vim

# TMUX
if not_installed tmux; then
  brew install tmux
fi
ln -fs $CONFIG_DIR/.tmux.conf ~/.tmux.conf

# git
ln -fs $CONFIG_DIR/.gitconfig ~/.gitconfig
brew install git-lfs
git lfs install

# Ruby
# used by jekyll for my blog
if not_installed ruby-install && not_installed chruby; then
  echo "Installing ruby!"
  brew install chruby ruby-install
fi
if ! ruby -v | grep 3.4.1 -q; then
  ruby-install 3.4.1
  gem update --system # was having issues installing bundles due to outdated gem
fi

# Misc Utils
brew install htop

