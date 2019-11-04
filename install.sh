#brew install ctags #we on osx now.
rm -rf  ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
mv ~/.vimrc ~/vimrc-legacy00
ln -s ~/.vim/scripts/rcs/vimrc ~/.vimrc
