#! /bin/bash

# Author: Lorenzo D Moon
# Purpose: This script installs and sets up everything for a linux terminal
# environment.
# Installs:

PREFIX="[ LODOMO SETUP ]"

# Create a function to check if something is installed
# Arg1: Program name
# Arg2: Command name
# Useful in instances like neovim / nvim
function apt_install() {
	PROGRAM=$1
	COMMAND=$2

	# If there's no $2, set PROGRAM to $1
	if [ -z $COMMAND ]; then
		COMMAND=$PROGRAM
	fi

	if [ -x "$(command -v $COMMAND)" ]; then
		echo "$PREFIX $PROGRAM is already installed."
	else
		echo "$PREFIX Installing $PROGRAM..."
		sudo apt install $PROGRAM -y
	fi
}

# Update and Upgrade if it's been more than 12 hours
function update_upgrade() {
	LAST_UPDATED=$(stat -c %Y /var/cache/apt/pkgcache.bin)
	CURRENT_TIME=$(date +%s)
	TIME=$1 # In Seconds

	if [ -z "$TIME" ]; then
		# Default 12 hours
		TIME="43200"
	fi

	HOURS=$((TIME / 3600))
	echo "HOURS: $HOURS"

	if [ $((CURRENT_TIME - LAST_UPDATED)) -gt $TIME ]; then
		echo "It's been more than $HOURS hours."
		sudo apt-get update
		sudo apt-get upgrade -y
	else
		echo "$PREFIX $HOURS h since the last update. Skipping..."
	fi
}

update_upgrade "43200"
apt_install "git"
apt_install "ripgrep"
apt_install "neovim" "nvim"
apt_install "zsh"
apt_install "tmux"
apt_install "lua5.4"
apt_install "python3"
apt_install "python3-pip" "pip"
apt_install "pipenv"
apt_install "g++"
apt_install "gcc"
apt_install "make"
apt_install "valgrind"
apt_install "gdb"

# Install oh my zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "$PREFIX Oh My Zsh is already installed."
else
	echo "$PREFIX Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Get P10K theme for zsh
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
	echo "$PREFIX Powerlevel10k theme is already installed."
else
	echo "$PREFIX Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Set the p10k Settings
echo "$PREFIX Setting up Powerlevel10k theme..."
echo "$PREFIX Use p10k configure if you don't like it"
cat ./p10k.zsh >~/.p10k.zsh

echo "$PREFIX Installing tmux plugin manager..."
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "$PREFIX Tmux plugin manager is already installed."
else
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

function change_to_p10k() {
	# Change the theme to p10k
	sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
	echo "$PREFIX Changed theme to Powerlevel10k."
}

change_to_p10k

# Setting up tmux config and tmux plugin manager
# This will overwrite the existing tmux config
echo "$PREFIX Setting up tmux config..."
cat ./tmux.conf >~/.tmux.conf
