so ~/.config/nvim/maps.vim
so ~/.config/nvim/vim-plug/plugins.vim

syntax on

" Show line numbers
set number

" Show relative number line
set relativenumber

" Status bar
set laststatus=2

" Automatically wrap text that extends beyond the screen lenght
set wrap

" Encoding
set encoding=utf-8

" Cursor line
set cursorline

" To use the operating system clipboard
set clipboard=unnamedplus

" Highlight matches
set hlsearch

" Incremental seraching
set incsearch

" Searches are case insensitive...
set ignorecase 

" ... unless they contain at least one capital letter
set smartcase

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
