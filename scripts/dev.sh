#!/bin/bash

cd $HOME
mkdir devtools
cd devtools/


read -p "Do you want to install Odin? [y/N]" yn
if [[ $yn == [Yy] ]]; then
	sudo apt install clang llvm libstdc++-12-dev -y
	git clone https://github.com/odin-lang/Odin
	cd Odin
	make release-native
	cd ..
fi

read -p "Do you want to install Neovim? [y/N]" ny
if [[ $ny == [Yy] ]]; then
	sudo apt install ninja-build gettext cmake curl build-essential -y
	git clone https://github.com/neovim/neovim
	cd neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
	cd ..
fi

read -p "Do you want to install Neovim Configs? [y/N]" ny
if [[ $ny == [Yy] ]]; then
    if [ ! -d "$HOME/.var/app/io.neovim.nvim" ]; then
        echo "vim plug not installed"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
	cd $HOME
	cd .config
    if [ ! -d "$HOME/.config/nvim/" ]; then
        echo "nvim config has not been cloned"
	    git clone git@github.com:GD-n-Dev/nvim.git
    fi
	cd $HOME
	cd devtools/
fi

cd $HOME

echo "Dev script ran"
