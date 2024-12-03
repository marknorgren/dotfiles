#!/bin/sh

# Install Oh My ZSH! if not installed
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Running setup script for Mark's Dotfiles..."

# Get sudo access up front
sudo -v

echo "Installing dependencies for Ruby..."
brew install coreutils curl git gpg gawk zsh yarn asdf direnv

# Install Ruby if not already installed
if ! asdf plugin-list | grep -q 'ruby'; then
  asdf plugin-add ruby
fi
if ! asdf list ruby | grep -q 'latest'; then
  asdf install ruby latest
  asdf global ruby latest
fi

# Install NVM if not already installed
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

echo "Installing required gems..."
gem install colored colored2

echo "Symlinking dotfiles..."
rake symlink

# Uncomment the following line if you want to install macos_essentials
# echo "Installing macos_essentials..."
# ./.macos_essentials

echo "Setup complete."



