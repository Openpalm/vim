set nocompatible
set nu
set laststatus=2
set termencoding=utf-8
filetype indent plugin on
syntax enable

"#######################
"undo & backupdir
"#######################

let g:auto_save = 1
set backup                        " enable backups
set noswapfile

set undodir=~/tmp/undo/     " undo files
set backupdir=~/tmp/backup/ " backups
set directory=~/tmp/swap/   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

set history=1000
set undofile "we like the undo file"
set undolevels=1000
set undoreload=1000
" swap dir
augroup NoSimulataneousEdits
  autocmd!
  autocmd SwapExists * let v:swapchoice= 'o'
  autocmd SwapExists * echomsg ErrorMsg
  autocmd SwapExists * echo 'Duplicate edit session (readonly)'
  autocmd SwapExists * echohl None
augroup END




