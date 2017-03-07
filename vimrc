syntax on                  " syntax highlighting
filetype on                " detect file types
filetype plugin on         " and load plugins for them
filetype indent on

set shell=/bin/bash
set nocompatible           " no vi compatibility
set number                 " line numbers
set autoread               " reload files changes outside vim
set encoding=utf-8
set fileencoding=utf-8
set ignorecase             " ignore case when searching
set backspace=indent,eol,start " insert mode backspace will delete over line breaks/auto-inserted indentation
set hidden                 " keep abandoned buffers in background
set fileformat=unix        " unix line endings
set fileformats=unix
set viminfo='100,f1        " save up to 100 marks, enable capital marks
set nobackup               " remove .ext~ files
set nowb
set noswapfile
set incsearch              " find the next match when typing the search
set hlsearch               " highlight searches by default
set wildmode=list:longest  " suggestion for normal mode commands
set scrolloff=3            " keep cursor visible within 3 lines when scrolling
set expandtab              " use spaces instead of tabs
set autoindent             " autoindent based on line above, works most of the time
set smartindent            " smarter indent for C-like languages
set shiftwidth=2           " when reading, tabs are 2 spaces
set softtabstop=2          " in insert mode, tabs are 2 spaces
set textwidth=100          " no lines longer than 100 cols
set scrolloff=5            " show 5 lines before and after cursor
set whichwrap+=<,>,h,l,[,] " wrap left and right in all modes
set pastetoggle=<f9>       " use f9 instead of :set paste and :set nopaste over SSH
set colorcolumn=100        " make a mark for column 100

let mapleader = ","  

" Restore cursor position to last edited line
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
nnoremap <esc> :noh<return><esc>
inoremap <Nul> <C-n>       
noremap <leader>a ggVG
map <C-k> :bnext<cr>
map <C-j> :bprevious<cr>

if executable('ag')
  set grepprg=ag\ --nogroupi\
endif

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap K :Ag<SPACE>
