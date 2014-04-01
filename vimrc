set background=dark
syntax enable

set foldmethod=manual

set matchpairs+=<:> " these tokens belong together
set showmatch " briefly jump to matching bracket

" the following two settings assume that you know what you are doing
set autowrite " automatically save changes when executing critical commands
set autoread " automatically detect changes and re-read the file

set backspace=2 " allow backspacing

set complete+=k " where to look for keyword completion
"set completeopt=menuone " not avaivable in this vim-version

" some regex patterns for C/C++
set include=\"^#\\s*include\" " match include directives
set define=\"^\\(#\\s*define\\|[a-z]*\\s*const\\s*[a-z]*\\)\" "recognize #define macros


set display=lastline " display as much as possible from the last line
set fileformats=unix,dos,mac " list of supported file formats, order matters

set formatoptions=tcrq2 " how to format text - see :help fo-table
set hidden " don't make me miss changes in hidden buffers
set report=0 " if lines got changed: tell me
set scrolloff=3 " some some context lines when scrolling

set hlsearch " highlight search results
set incsearch " live search results
set infercase " adjust the case of auto completed words
set nojoinspaces " don't insert two spaces after '.', '?' and i '!' if two lines get joined

"set mouse=a " enable mouse support in all modes

" set linebreak " activate smart line breaking; only works or ASCII/8-bit encoding
"set list " shows us whether tabs or spaces are used

set shell=/bin/bash

" the following will help you not add more wrong whitespace
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
" match WhitespaceEOL /\S\+&/

set showfulltag

" tip: 'set paste' manually before pasting any content to a file!
set autoindent " remember indentation of the previous line
set copyindent
" I prefer smartindent over cindent if I'm not hacking on C code or something similar
" I use devel-vimrc to set settings like this based on the actual file type I'm editing
" check: :h cindent :h C-indenting :h filetype-indent-on :smartindent
" set smartindent
set cindent
set number " show line numbers

" The number of spaces used for each step of (auto)indent
" These options get reset by devel-vimrc for certain file types, i.e. python
set shiftwidth=4
set tabstop=4
set expandtab
"set softtabstop=2
set shiftround

set nostartofline " don't make ctrl+u/d to jump to the first column filled with a token
set ruler " display line and column number, and the relative cursor position

" assign a lower priority to certain file suffixes
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.indx,.out,.toc,.gz,.idx,.ps.,.tar,.pdf

"set swapsync=sync " use unix syscall sync()
set whichwrap=<,>,[,],b,s " allow these keys to move around at wrapping places
set wildmenu " enhance command-line completion
set encoding=utf-8

" Tip #370: always cd to the current file's directory
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h |  endif

cabbrev Wq wq
cabbrev W w
cabbrev Q q

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" set secure " I live a dangerous life anyway

" commands for split screen
"Fenster wechseln
map + <C-w>w
 
"Fenster tauschen mit Strg+x
map <C-x> <C-w>x

"Maps zum ändern von Splitscreens
map <C-j> <C-w>+
map <C-k> <C-w>-
map <C-h> <C-w><
map <C-l> <C-w>>

source ~/cscope_maps.vim
