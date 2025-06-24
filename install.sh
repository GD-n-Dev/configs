#!/bin/bash
#set -e

echo "Starting System Setup..."
sudo -v

scripts=(./scripts/*)

for script in "${scripts[@]}"; do
	source "$script"
done

#source ./scripts/system.sh
#source ./scripts/dev.sh
#source ./scripts/apps.sh

echo "Setup Complete!"
