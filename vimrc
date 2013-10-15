filetype off

call pathogen#infect()

set nocompatible                            " Must come first because it changes other options.
set autochdir
set nostartofline 							            " don't jump to the first character when paging
set title                   		            " Set the terminal's title
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler 									                " Show cursor position.
set number 									                " Show line numbers.
set showcmd 								                " Display incomplete commands.

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
" BEHAVIOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread								                " Check for files changes outside VIM
set noautowrite
set visualbell							                " Use a visual bell instead of beeping
set showmode 								                " Display the mode you're in.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden                 	                " Handle multiple buffers better.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch 							                " Highlight matches as you type.
set hlsearch 								                " Highlight matches.
set ignorecase							                " Ignore case when searching
set infercase								                " 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKUPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup 								                " Don't make a backup before overwriting a file.
set nowritebackup 					                " And again.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOURS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable 							                " Turn on syntax highlighting.
colorscheme wombat256
filetype plugin indent on 	                " Turn on file type detection.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual
set foldenable
set foldopen=block,hor,mark,percent,quickfix,tag
set foldminlines=2
set fillchars+=fold:\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT EDITING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2 							                " Global tab width.
set shiftwidth=2 						                " And again, related.
set expandtab								                " expand <Tab> to spaces in Insert mode
set encoding=utf-8					                " Use UTF-8 everywhere.
set nowrap									                " Disable word wrap
set wildmenu 								                " Enhanced command line completion.
set wildmode=list:longest 	                " Complete files like a shell.
set tabstop=2 							                " Global tab width.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPELLING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERMINAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tty=win32

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS PER FILETYPE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on

if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
  
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType xhtml setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType cs setlocal ts=4 sts=4 sw=4 expandtab
    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
    autocmd BufNewFile,BufRead *.config setfiletype xml

    " CSS, XML, and HTML file shoulds be folded based on indent
    au BufNewFile,BufRead *css,*xml,*htm* set foldmethod=indent
    
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" imap <Tab> <C-N>
map <Leader>cd :cd %:p:h<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" bind command-]/command-[ to act like TextMate
nmap <C-]> >>
nmap <C-[> <<
vmap <C-]> >gv
vmap <C-[> <gi

" Format the current document
nmap <Leader>f ggVG=

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Deactivate the default F1 behavior of launching VIM help.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Toggle search highlight
nnoremap <silent> \ :silent :set invhlsearch<CR>:set hlsearch?<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD_TREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EASYTAGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:easytags_resolve_links = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAG LIST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_WinWidth = 40
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = 'name'
let Tlist_Show_Menu = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1

nnoremap <silent> <Leader>t :TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUGITIVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
