#!/bin/sh
# Setup Karabiner
brew install karabiner-elements
mkdir -p $HOME/.config/karabiner && ln -s $HOME/dotfiles/karabiner/assets $HOME/.config/karabiner/assets
ln -s $HOME/dotfiles/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

