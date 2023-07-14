#!/bin/sh
# Setup Git
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
brew install git-lfs
echo "[user]" > $HOME/.gitconfig.secret
read -p "Enter Git name: " REPLY && echo "\tname = $REPLY" >> $HOME/.gitconfig.secret
read -p "Enter Git email:" REPLY && echo "\temail = $REPLY" >> $HOME/.gitconfig.secret
mkdir $HOME/.local/bin && ln -s $HOME/dotfiles/git-churn $HOME/.local/bin/git-churn

# Setup Delta
brew install git-delta

# Setup Meld
brew install meld

# Setup Tig
brew install tig

# Setup Absorb
brew install git-absorb

# Setup Git Extras
brew install git-extras
