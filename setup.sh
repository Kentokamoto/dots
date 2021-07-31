#!/bin/bash
# Determine OS

# Pretty Colors!
GREEN='\033[1;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

OSTYPE=$(uname)
SSH_ENCRYPTION="ECDSA"
RTORRENT_INSTALL=0
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#Functions
useHomebrew () {
    brew install $1
}

useLinux () {
    echo -e "use Linux $1"
}

installPackage () {
    arch=$1
    package=$2
    case $arch in
        ALL)
            if [ "$OSTYPE" == "Darwin" ]; then
                useHomebrew $package
            else
                useLinux $package
            fi
            ;;
        *)
            ;;
    esac

}

#Start Here
if [ "$OSTYPE" == "Darwin" ]; then
    echo -e "${GREEN}macOS${NC}"
else
    echo -e "${GREEN}Linux${NC}"
fi

if [ "$OSTYPE" == "Darwin" ]; then
    echo -e "${GREEN}Installing Dev Tools${NC}"
    if [[ $(xcode-select -p 1>/dev/null;echo $? ) -eq 0 ]]; then
        echo -e "${RED}Xcode Command Line tools already installed${NC}"
    else
        xcode-select --install 
    fi
    echo -e "${GREEN}Installing Homebrew${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo -e "${GREEN}Setting up SSH Key${NC}"
if [ "$SSH_ENCRYPTION" == "ECDSA" ]; then
    echo -e "${GREEN}Using ECDSA${NC}"
    ssh-keygen -t ecdsa -b 521 -C "$USER@HOSTNAME"
else
    echo -e "${GREEN}Usint RSA 4096${NC}"
    ssh-keygen -t rsa -b 4096 -C "$USER@$HOSTNAME"
fi


#Misc
if [ $RTORRENT_INSTALL -eq 1 ]; then
    #For rtorrent
    echo -e "${GREEN}Installing rtorrent${NC}"
    mkdir -p $HOME/Downloads/sessions/
    if [ "$OSTYPE" == "Darwin" ]; then
        useHomebrew "rtorrent"
    else
        useLinux "rtorrent"
    fi
    ln -sf $SCRIPTPATH/.rtorrent.rc $HOME/.rtorrent.rc
fi


# Packages
cat packages | while read arch package; do
    installPackage $arch $package
done

#Various 3rd party sources
echo -e "${GREEN}Install Vundle (Vim)${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Powerline font
echo -e "${GREEN}Installing Powerline font${NC}"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
 clean-up a bit
cd ..
rm -rf fonts

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
ln -sf $SCRIPTPATH/.vimrc $HOME/.vimrc
ln -sf $SCRIPTPATH/.zshenv $HOME/.zshenv
ln -sf $SCRIPTPATH/.zshrc $HOME/.zshrc

