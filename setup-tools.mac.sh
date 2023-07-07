#!/bin/sh
# Setup Node
fnm install --lts

# Setup ripgrep
brew install ripgrep
ln -s $HOME/dotfiles/ignore $HOME/.ignore

# Setup Neovim
brew install neovim
mkdir -p $HOME/.config/nvim && ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
pip3 install --user neovim
npm i -g neovim
mkdir -p $HOME/.config/coc && ln -s $HOME/dotfiles/UltiSnips $HOME/.config/coc/UltiSnips

# Setup ctags
brew install universal-ctags

