#!/bin/sh
chsh -s /bin/zsh

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install GNU CoreUtils
brew install coreutils

echo 'PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"' >> $HOME/.zprofile
echo 'MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"' >> $HOME/.zprofile

# Install GitHub CLI
brew install gh

# Install term dependencies
brew install fnm
brew install starship

# Add SSH key to GitHub
ssh-keygen -t ed25519 -C "user@vdumitraskovic.com"
gh auth login

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

# Setup Node
fnm install --lts

# Setup Fonts
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font

# Setup Kitty
brew install kitty
mkdir -p $HOME/.config/kitty && ln -s $HOME/dotfiles/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $HOME/dotfiles/kitty-font-jetbrains-nf.conf $HOME/.config/kitty/fonts.conf
ln -s $HOME/dotfiles/kitty-pencil-light.conf $HOME/.config/kitty/colors.conf

# Setup ripgrep
brew install ripgrep
ln -s $HOME/dotfiles/ignore $HOME/.ignore

# Setup Neovim
brew install neovim
mkdir -p $HOME/.config/nvim && ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
pip3 install --user neovim
npm i -g neovim
mkdir -p $HOME/.config/coc && ln -s $HOME/dotfiles/UltiSnips $HOME/.config/coc/UltiSnips

# Setup TMUX
brew install tmux
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/tmux-osx.conf $HOME/.tmux-osx.conf
ln -s $HOME/dotfiles/tmux-pencilcolors.conf $HOME/.tmux-colors.conf
brew install reattach-to-user-namespace
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
tic -x $HOME/dotfiles/tmux-256color.terminfo

# Setup Git
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
brew install git-lfs
echo "[user]" > $HOME/.gitconfig.secret
read -p "Enter Git name: " REPLY && echo "\tname = $REPLY" >> $HOME/.gitconfig.secret
read -p "Enter Git email:" REPLY && echo "\temail = $REPLY" >> $HOME/.gitconfig.secret

# Setup tig
brew install tig

# Setup ctags
brew install universal-ctags

# Setup Karabiner
brew install karabiner-elements
## TODO Setup caps-lock/escape/ctrl

# Setup FZF
brew install fzf

# Setup FD
brew install fd

# Setup Bat
brew install bat

# Setup Delta
brew install git-delta

# Setup Meld
brew install meld

# Setup source-highlight
brew install source-highlight
