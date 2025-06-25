#!/bin/bash

cd ./tools/

read -p "Do you want to install This is a test? [y/N]" yn
if [[ $yn == [Yy] ]]; then
	echo "sudo apt install what ever"
	mkdir test
	cd test
	pwd
	echo "running make"
	pwd
	cd ..
	pwd
fi

read -p "Do you want to install Odin? [y/N]" yn
if [[ $yn == [Yy] ]]; then
	sudo apt install clang llvm libc++-dev
	git clone https://github.com/odin-lang/Odin
	cd Odin
	make release-native
	cd ..
fi

read -p "Do you want to install Neovim? [y/N]" ny
if [[ $ny == [Yy] ]]; then
	sudo apt install ninja-build gettext cmake curl build-essential
	git clone https://github.com/neovim/neovim
	cd neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
	cd ..
fi

cd ..

echo "Dev script ran"
