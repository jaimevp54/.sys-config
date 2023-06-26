#!/bin/bash

# Get this file by installing git and cloning. 
# sudo apt install git -y & git clone https://github.com/jaimevp54/.sys-config ~/.sys-config

echo "Creating .gitconfig hard link..."
ln ~/.sys-config/git/.gitconfig ~/.gitconfig

echo "Installing Github cli..."
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
echo "Installing Github cli... Done"

echo "**************************"

echo "Installing i3..."

sudo apt install curl -y
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

echo "Installing i3... Done."

echo "**************************"

echo "Setting up keyboard mappings..."
ln ~/.sys-config/.Xmodmap ~/.Xmodmap
xmodmap ~/.Xmodmap
echo "Setting up keyboard mappings... Done"

echo "**************************"

echo "Setting up i3..."
echo "Deleting old i3 config file if exists..."
rm -rf ~/.config/i3/
echo "Creating .configs/.i3 directory..."
mkdir ~/.i3
echo "Creating config hard link..."
ln ~/.sys-config/i3/config ~/.i3/config
echo "Setting up i3... Done" 

echo "**************************"

echo "Installing NeoVim..."
sudo apt-get install neovim -y
echo "Installing NeoVim..."



echo "Installing Vundle..."
su - root -c 'echo "source ~/.sys-config/vim/.vimrc" >> /usr/share/vim nvim/sysinit.vim'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Installing NeoVim copilot..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\\
sudo apt-get install -y nodejs
vim -c ":Copilot setup"

echo "**************************"

echo "Installing Docker..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "**************************"

echo "Installing misc packages..."
sudo apt install tree ripgrep -y

echo "Finished setup..."

