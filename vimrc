set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
Bundle 'fugitive.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/Command-T'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'altercation/vim-colors-solarized.git'

let mapleader = ","
" Formatting
map <Leader>i mmgg=G`m<CR>

nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
nmap <Leader>bs :BundleSearch 

map <Leader>bl :buffers<CR>

" GIT 
map <Leader>gs :Gstatus<CR>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>

" Working with files
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

map <Leader>so :so %<cr>

map <Leader>x :NERDTree<CR>

" Bubble single lines
nmap <D-Up> [e
nmap <D-Down> ]e
" Bubble multiple lines
vmap <D-Up> [egv
vmap <D-Down> ]egv

" bind command-]/command-[ to act like TextMate
nmap <D-]> >>
nmap <D-[> <<
vmap <D-]> >gv
vmap <D-[> <gv

" Disable Ex mode
map Q <Nop>

set tags=./tags;

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable
filetype plugin indent on

set nocompatible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set autoindent
set showmatch
set nowrap
set autoread
set wmh=0
set number
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set ignorecase smartcase
set laststatus=2  " Always show status line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set incsearch 							                
set hlsearch 								       
set ignorecase							              
set infercase	

set background=dark
colorscheme solarized
