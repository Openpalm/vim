#brew install ctags #we on osx now.
mkdir -p bundle

VPATH=bundle/Vundle.vim

if [ ! -f "$VPATH" ]; then 
	echo "getting Vundle.vim ..."
	git clone https://github.com/VundleVim/Vundle.vim bundle/Vundle.vim 
fi

VRCPATH=~/.vimrc
SRCPATH=~/.screenrc

if [ -f "$VRCPATH" ] ; then mv ~/.vimrc ~/.vimrc-legacy-"`date +%F-%H:%M:%S`";fi
if [ -f "$SRCPATH" ]; then mv ~/.screenrc ~/.screen-legacy-"`date +%F-%H:%M:%S`";fi

sh -e ./scripts/rcs/setup1/link
vim +PluginInstall +qall
vim +PluginUpdate +qall
vim -c "call coc#util#install()"
vim -c "CocInstall coc-css"
