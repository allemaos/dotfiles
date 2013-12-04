version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set fileencodings=ucs-bom,utf-8,latin1
set guicursor=n-v-c:block,o:hor50,i-ci:hor15,r-cr:hor30,sm:block,a:blinkon0
set helplang=en
set history=50
set viminfo='20,\"50
" vim: set ft=vim :




" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
"
"------------------------------------------------------------
" Features {{{1

" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
"
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on
"
" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

set hidden
" Better command-line completion. show auto complete menus.
set wildmenu
" Make wildmenu behave like bash completion. Finding commands are so easy now.
set wildmode=list:longest
" run the Bash script by pressing F6 without leaving VIM.
map <f6> :w <CR>:!bash % <CR> 

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

"------------------------------------------------------------
" Usability options {{{1
"
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase


" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
"
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
"
" Always display the status line, even if only one window is displayed
set laststatus=2
"
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
"
" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
"
" Display line numbers on the left
set number
set numberwidth=3
set cpoptions+=n
highlight LineNr ctermfg=grey
"Toggle line numbers by pressing Ctrl-N twice in normal mode
nmap <C-N><C-N> :set invnumber<CR>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
"
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" show location of cursor using a horizontal line.
set cursorline
" keep cursor in the middle of the screen while scrolling up and down.
set scrolloff=999

