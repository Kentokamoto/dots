#!/bin/bash
# Determine OS

# Pretty Colors!
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

OSTYPE=$(uname)
SSH_ENCRYPTION="EDDSA"
RTORRENT_INSTALL=0
SCRIPTPATH="$(
	cd -- "$(dirname "$0")" >/dev/null 2>&1
	pwd -P
)"

#Start Here
if [ "$OSTYPE" == "Darwin" ]; then
	echo -e "${GREEN}macOS${NC}"
else
	echo -e "${GREEN}Linux${NC}"
fi

if [ "$OSTYPE" == "Darwin" ]; then
	echo -e "${GREEN}Installing Dev Tools${NC}"
	if [[ $(
		xcode-select -p 1>/dev/null
		echo $?
	) -eq 0 ]]; then
		echo -e "${RED}Xcode Command Line tools already installed${NC}"
	else
		xcode-select --install
	fi
	echo -e "${GREEN}Installing Homebrew${NC}"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo -e "${GREEN}Setting up SSH Key${NC}"
ssh-keygen -t ed25519 -C "$USER@$HOST"

# Make the .config path from home
mkdir -p ~/.config

# Packages
# cat packages | while read arch package; do
#     installPackage $arch $package
# done

#Various 3rd party sources

#
#Install Rust
echo -e "${GREEN}Install Rust${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Install Pip
echo -e "${GREEN}Install Pip${NC}"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py

# Install Oh-My-ZSH
echo -e "${GREEN}Installing Oh-My-ZSH${NC}"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Linking Dot Files
echo -e "${GREEN}Linking Dot Files${NC}"

ln -sf $SCRIPTPATH/.tmux.conf $HOME/.tmux.conf
ln -sf $SCRIPTPATH/.config/nvim $HOME/.config/nvim
ln -sf $SCRIPTPATH/.config/helix $HOME/.config/helix
ln -sf $SCRIPTPATH/.config/alacritty $HOME/.config/alacritty
ln -sf $SCRIPTPATH/.config/zellij $HOME/.config/zellij
ln -sf $SCRIPTPATH/.vimrc $HOME/.vimrc
ln -sf $SCRIPTPATH/.zshrc $HOME/.zshrc

if [ "$OSTYPE" == "Darwin" ]; then
	ln -sf $SCRIPTPATH/.zshenv_mac $HOME/.zshenv
else
	ln -sf $SCRIPTPATH/.zshenv_linux $HOME/.zshenv
fi
