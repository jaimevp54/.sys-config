echo "Setting up keyboard mappings"
ln .Xmodmap ~/.Xmodmap
xmodmap ~/.Xmodmap

echo "Setting up i3"
echo "Deleting old i3 config file if exists"
rm -rf .config/i3/
echo "Creating .configs/.i3 directory "
mkdir ~/.i3/
echo "Creating config hard link"
ln i3/config ~/.i3/config

echo "Setting up Vim"
echo "source ~/.sys-config/vim/.vimrc" >> ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Running plugin install"
vim +PluginInstall +qall


echo "Setting up git"

echo "Creating .gitconfig hard link"
ln git/.gitconfig ~/.gitconfig
