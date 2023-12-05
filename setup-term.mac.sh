#!/bin/sh
# Install GNU CoreUtils
brew install coreutils

echo 'PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"' >> $HOME/.zprofile
echo 'MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"' >> $HOME/.zprofile

# Install term dependencies
brew install starship

# Install antigen
mkdir $HOME/.zsh/
curl -L git.io/antigen > $HOME/.zsh/antigen.zsh

# Setup ZSH 
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zsh_alias $HOME/.zsh_alias
ln -s $HOME/dotfiles/zsh.pencil $HOME/.zsh.theme
ln -s $HOME/dotfiles/dircolors-light $HOME/.dircolors
touch $HOME/.zsh_secret
source $HOME/.zshrc

# Starship
mkdir -p $HOME/.config && ln -s $HOME/dotfiles/starship.toml $HOME/.config/starship.toml

# Setup Fonts
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font

# Setup Kitty
brew install kitty
mkdir -p $HOME/.config/kitty && ln -s $HOME/dotfiles/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $HOME/dotfiles/kitty-font-jetbrains-nf.conf $HOME/.config/kitty/fonts.conf
ln -s $HOME/dotfiles/kitty-pencil-light.conf $HOME/.config/kitty/colors.conf

# Setup TMUX
brew install tmux
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/tmux-osx.conf $HOME/.tmux-osx.conf
ln -s $HOME/dotfiles/tmux-pencilcolors.conf $HOME/.tmux-colors.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
tic -x $HOME/dotfiles/tmux-256color.terminfo

# Setup FZF
brew install fzf
/opt/homebrew/opt/fzf/install

# Setup FD
brew install fd

# Setup Bat
brew install bat

# Setup source-highlight
brew install source-highlight
