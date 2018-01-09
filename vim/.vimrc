"----------------BASIC--------------------
set nocompatible
set shortmess=atI
" set mouse=a
set number
set numberwidth=6
set relativenumber
set wildmenu
set gcr=a:blinkon0
set clipboard=unnamed
set scrolloff=4
set nrformats-=octal
set history=200
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set vb t_vb=
set autoread
set nobackup
set noundofile

"----------------INDENT-------------------
set tabstop=4                   " 设置tab长度为4个空格
set expandtab                   " 把tab转为空格
set shiftwidth=4                " 设置当行之间缩进时使用4个空格
set autoindent                  " 自动缩进
set smartindent                 " 智能对齐
set cindent                     " 使用C样式的缩进

"----------------TYPE---------------------
filetype on
filetype plugin on
filetype indent on
syntax on

"-------------STATUS BAR------------------
set ruler
set showcmd
set noshowmode
set laststatus=2
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

"----------------MAP----------------------
imap jk <ESC>
imap kj <ESC>

inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap Y y$
nnoremap H ^
nnoremap L $

nmap // gcc
vmap // gc

nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

"---------------COMMAND-------------------
" command Trim :%s/\s\+$//g
cmap trim %s/\s\+$//g
cmap w!! w !sudo tee >/dev/null %

"---------------ENCODING------------------
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

"----------------THEME--------------------
if !has("gui_running")
    if has("termguicolors")
        set termguicolors " for vim 8.0+
    else
        set t_Co=256
    endif
endif
colorscheme darcula-copy

"----------------HILIGHT------------------
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

set cursorline
set cursorcolumn

set colorcolumn=100
hi OverLength ctermbg=236 ctermfg=NONE guibg=#333333
match OverLength /\%101v.\+/

hi ExtraSpace ctermbg=236 ctermfg=NONE guibg=#333333
2match ExtraSpace /\v\s+$/

"--------------SPECIAL--------------------
if has('gui_running')
    set go=
    au GuiEnter * set t_vb=
    set linespace=1

    if has('win32')
        " set lines=32
        " set columns=132
        autocmd GUIEnter * simalt ~x
        set guifont=Fira_Code:h14
        " DirectX rendering for Fira_Code ligatures
        set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
        " set shell=bash.exe
    endif

    if has('unix')
        set guifont=Fira\ Code\ 14
    endif
endif

"---------------vim-plug------------------
if has("win32")
    source $HOME/_vim_plug
else
    source ~/.vim_plug
endif
