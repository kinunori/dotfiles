dotfiles
========

my dotfiles

#install
git clone https://github.com/kinunori/dotfiles.git

cd dotfiles

chmod 755 otfile_set.sh

./dotfile_set.sh

#set up vim

cd ~/dotfiles

git submodule init
git submodule update

vim

:NeoBundleInstall
