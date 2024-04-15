#!bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt install neovim -y
sudo apt install git -y
sudo apt install zsh -y

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

