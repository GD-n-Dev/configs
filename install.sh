#!/bin/bash
#set -e

echo "Starting System Setup..."
cd $HOME
cd configs
sudo -v

scripts=(./scripts/*)

for script in "${scripts[@]}"; do
	read -p "Do you want to run ${script}? [y/N]" yn
	if [[ $yn == [Yy] ]]; then
		echo "Installing ${script}"
		source "$script"
	else
		echo "Not Installing ${script}"
	fi
done

echo "Setup Complete!"
