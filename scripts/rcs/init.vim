set nu
call plug#begin()
" - VIM PLUG

" deoplete plugin for autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" autotag plugin to automatically generate ctags file
Plug 'craigemery/vim-autotag'

" ctags stuff

set tags=.tags
let g:autotagTagsFile=".tags"

map <C-i> :TagbarToggle<CR>
nnoremap <F9> :Explore<CR>
nnoremap sss :%s/\s\+$//<CR>

" Map the leader key to SPACE
let mapleader = " "

" Regenerate tags file
map <leader>r :!ctags -R -f ./.tags .<CR>

" FZF / Ctrlp for file navigation
if executable('fzf')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif

" Ripgrep for file indexing, sort of faster, but not really, but also why not use ripgrep for everything
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
  set grepprg=rg\ --vimgrep
endif

" SBT server
set signcolumn=yes
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'scala': ['node', expand('/usr/local/bin/sbt-server-stdio.js')]
    \ }
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
set omnifunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()


"togglelist - toggle quickfix list with leader-q
let g:toggle_list_no_mappings = 1
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" Use FZF for files and tags if available, otherwise fall back onto CtrlP
" <leader>\ will search for tag using word under cursor
let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>f :FzfFiles<cr>
  nnoremap <leader>t :FzfTags<cr>
  nnoremap <leader>u :call fzf#vim#tags("'".expand('<cword>'))<cr>
else
  nnoremap <leader>f :CtrlP<Space><cr>
  nnoremap <leader>t :CtrlPTag<Space><cr>

endif

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'        : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }

" deoplete stuff

let g:deoplete#enable_at_startup = 1

" Remap <tab> to allow cycling through the deoplete list, but only when the
" deoplete list window is open. Leave <tab> alone the rest of the time.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" Here's the complete list of my neovim plugins, in case you're interested
" General
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'sbdchd/neoformat'
Plug 'luochen1990/rainbow'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'embear/vim-localvimrc'
Plug 'cloudhead/neovim-fuzzy'
Plug 'bling/vim-airline'
Plug 'milkypostman/vim-togglelist'
Plug 'eed3si9n/LanguageClient-neovim'

let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle 1 to enable by default


" Tags
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'


" Language plugins
" Scala plugins
if executable('scalac')
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif
if executable('sbt')
    Plug 'derekwyatt/vim-sbt'
endif

"colorscheme
Plug 'Badacadabra/vim-archery', { 'as': 'archery' }
call plug#end()


" LOOK AND SYNTAX HILIGHTING {{{
"fix for mac terminal colors going weird
    if $TERM =~ '^\(xterm\|interix\|putty\)\(-.*\)\?$'
        set notermguicolors
    else
        set termguicolors
        endif

syntax on
set background=dark

colorscheme industry
"let g:airline_theme = 'industry'

"set cursorline

"shortcut to move physical lines Alt-j and Alt-k
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" change vim scroll keys
"nnoremap <C-J> <C-D>
"nnoremap <C-K> <C-U>
"
"" change jump to definition
"nnoremap <leader>. <C-]>
"nnoremap <leader>, <C-T>
"
"" easier split navigations
"nnoremap <leader>j <C-W><C-J>
"nnoremap <leader>k <C-W><C-K>
"nnoremap <leader>l <C-W><C-L>
"nnoremap <leader>h <C-W><C-H>


" airline
set laststatus=2
let g:airline_left_sep=""
let g:airline_left_alt_sep="|"
let g:airline_right_sep=""
let g:airline_right_alt_sep="|"
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number not number of split panes
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_z = ""


"Bassel
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 
set autoindent
set smartindent
set nu

%retab
set wrapscan

if exists("*shiftwidth")
  func! s:sw()
    return shiftwidth()!
  endfunc
else
  func! s:sw()
    return &sw
  endfunc
endif

"#######################
"space tabs, instead of real tabs.
"#######################
set tabstop=2
"set noexpandtab
set expandtab
"set tabstop=2




"#######################
"ruler and measurements
"#######################
set ruler "Always show current position"
set nu "enables line numbers "
set relativenumber
set foldmethod=indent
"set foldnestmax=10
set nofoldenable
set foldlevel=1

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
  call mkdir(expand(&backupdir), "p") endif if !isdirectory(expand(&directory))
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



"#######################
" colorization
"#######################
syntax enable
set ofu=syntaxcomplete#Complete
syntax on

"#######################
"bracket completion"
"#######################

inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
  if exists("b:robstack")
    let b:robstack = b:robstack . a:schar
  else
    let b:robstack = a:schar
  endif
endfunction

function! BC_GetChar()
  let l:char = b:robstack[strlen(b:robstack)-1]
  let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
  return l:char
endfunction


function! BC_jumpBackChar(num)
  let l:char = b:robstack[strlen(b:robstack)-1]
  let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
  return l:char
endfunction


inoremap _( ()<Esc>:call BC_AddChar(")")<CR>i
inoremap _{ {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap _[ []<Esc>:call BC_AddChar("]")<CR>i
inoremap _" ""<Esc>:call BC_AddChar("\"")<CR>i
inoremap _' ''<Esc>:call BC_AddChar("\'")<CR>i

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"custom remaps
