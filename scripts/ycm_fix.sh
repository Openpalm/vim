sudo apt-get install build-essential cmake libclang-3.5-dev libboost-all-dev
rm -rf ~/.ycmtmp
mkdir ~/.ycmtmp
cd ~/.ycmtmp
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON  . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs


cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang --system-boost

