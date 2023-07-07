#!/bin/sh
chsh -s /bin/zsh

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install GitHub CLI
brew install gh

# Add SSH key to GitHub
ssh-keygen -t ed25519 -C "user@vdumitraskovic.com"
gh auth login

# Download dotfiles
gh repo clone vdumitraskovic/dotfiles
cd dotfiles && ./setup.mac.sh
