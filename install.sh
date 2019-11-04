#brew install ctags #we on osx now.
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

VRCPATH=~/.vimrc
SRCPATH=~/.screenrc

if test -f "$VRCPATH"; then mv ~/.vimrc ~/.vimrc-legacy-"`date +%F-%H:%M:%S`";fi
if test -f "$SRCPATH"; then mv ~/.screenrc ~/.screen-legacy-"`date +%F-%H:%M:%S`";fi

ln -s ~/.vim/scripts/rcs/vimrc ~/.vimrc
ln -s ~/.vim/scripts/rcs/screenrc ~/.screenrc

vim +PluginInstall +qall
