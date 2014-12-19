A Vim repo for the developer on the go.

It uses vundle to make life easier. a package manager makes more sense.
Because it's 2015 and git cloning repos by hand makes kittens cry.

How to install:

1. git clone https://github.com/Shokodemon/vim
2. run ./getModules
3. ln -s ~/.vim/rcs/vimrc ~/.vimrc
4. run vim, type :PluginInstall and let Vundle do its magic
5. YouCompleteMe will complain. but that's OK, see READMES/YCM_README.

Enjoy!

This repo is work in progress.

TODO: get completion to work with header files.
for now, YCM offers on-the-fly semantic checking for c/++.
