set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
Bundle 'ctrlp.vim'
Bundle 'tomasr/molokai'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

nnoremap ; :

map <Leader>i mmgg=G`m<CR>

" Bundle 
nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
nmap <Leader>bs :BundleSearch 

" Buffer
map <Leader>bl :buffers<CR>

" Git 
map <Leader>gs :Gstatus<CR>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>gac :Gcommit -m -a ""<LEFT>

" Windows 
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Source
map <Leader>so :so %<cr>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Search
nmap <silent> ,/ :nohlsearch<CR>

" NerdTree
map <Leader>x :NERDTree<CR>

" Line Bubbling
nmap <D-k> [e
nmap <D-j> ]e
vmap <D-k> [egv
vmap <D-j> ]egv

" Text mate style indentation
nmap <D-]> >>
nmap <D-[> <<
vmap <D-]> >gv
vmap <D-[> <gv

" Stop using those arrow keys!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Ex mode
map Q <Nop>


set tags=./tags;

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

set noesckeys
set ttimeout
set ttimeoutlen=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler                                   " Show cursor position.
set number 									                " Show line numbers.
set showcmd 								                " Display incomplete commands.
set title

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread                                " Check for files changes outside VIM
set noautowrite
set visualbell	                            " Use a visual bell instead of beeping
set noerrorbells
set showmode 					                      " Display the mode you're in.
set showmatch
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2					                  " Show the status line all the time
set statusline+=\ %{fugitive#statusline()}  " Fugitive status line
set statusline+=\ (%n)                      " buffer number
set statusline+=\ %([%M%R%H%W]\ %)          " Modified, Read-only, Help, and Preview flags
set statusline+=\ %y                        " Filetype

autocmd BufEnter * lcd %:p:h 
" Remember where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch 			                        " Highlight matches as you type.
set hlsearch 					                      " Highlight matches.
set ignorecase				                      " Ignore case when searching
set infercase					 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden                                  " Handle multiple buffers better.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT EDITING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2 				                      " Global tab width.
set shiftwidth=2 			                      " And again, related.
set expandtab		                            " expand <Tab> to spaces in Insert mode
set encoding=utf-8			                    " Use UTF-8 everywhere.
set wildmenu 				                        " Enhanced command line completion.
set wildmode=list:longest 	                " Complete files like a shell.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOURS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable
colorscheme molokai

highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 
