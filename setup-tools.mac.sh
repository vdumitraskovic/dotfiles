#!/bin/sh
# Setup Node
brew install fnm
fnm install --lts

# Setup node tools
npm i -g npm-check-updates
npm i -g yarn
npm i -g @fsouza/prettierd

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

# Setup TLDR
brew install tldr

# Setup JQ
brew install jq
