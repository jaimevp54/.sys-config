#!/bin/bash

# Get this file by installing git and cloning. 
# sudo apt install git -y & git clone https://github.com/jaimevp54/.sys-config ~/.sys-config

echo "Creating .gitconfig hard link..."
ln ~/.sys-config/git/.gitconfig ~/.gitconfig

echo "**************************"
echo "Adding bashrc configs..."
cat ~/.sys-config/.bashrc.append >> ~/.bashrc

echo "Installing Github cli..."
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
echo "Installing Github cli... Done"

echo "**************************"

echo "Setting up i3..."
ln ~/.sys-config/i3/config ~/.config/i3/config -f
echo "Setting up i3... Done" 

echo "**************************"
echo "Installing NeoVim copilot..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\\
sudo apt-get install -y nodejs
vim -c ":Copilot setup"

echo "**************************"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "**************************"
echo "Finished setup..."

