#! /bin/bash

# Author: Lorenzo D. Moon

echo "Copying config files to ~/.config/..."
cp -r ./config/ ~/.config/


if [ -x "$(command -v "nvim")" ]; then
		echo "Neovim is already installed."
	else
        sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
        git clone https://github.com/neovim/neovim
        cd neovim
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
	fi

nvim 
