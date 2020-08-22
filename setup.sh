#!/bin/bash
echo "Setting up SSH Key"
echo "Using RSA 4096"
ssh-keygen -t rsa -b 4096 -C "$USER@$HOSTNAME"

#Misc
#For rtorrent
mkdir -p $HOME/Downloads/sessions/

#Various 3rd party sources
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Powerline font
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
