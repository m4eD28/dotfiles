if &compatible
  set nocompatible
endif

set runtimepath+=/Users/maedar/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/maedar/.cache/dein')
  call dein#begin('/Users/maedar/.cache/dein')

  " Let dein manage dein
  call dein#add('/Users/maedar/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('/Users/maedar/dotfiles/.config/nvim/dein.toml',{'lazy':0})
  call dein#load_toml('/Users/maedar/dotfiles/.config/nvim/dein_lazy.toml',{'lazy':1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"htmlのカッコ補完
"augroup fileTypeIndent
"    autocmd!
"    autocmd BufNewFile,BufRead *.html inoremap < <><Left>
"augroup END

"vimをクリップボード連携
set clipboard+=unnamed

"全角スペースhighlight
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermbg=darkRed guibg=darkRed
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace','　')
    augroup END
    call ZenkakuSpace()
endif

nmap <silent> <Esc><Esc> :nohlsearch<CR>
nmap <F5> :!python % <Enter>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

set ruler
set encoding=utf-8
scriptencoding=utf-8
set number
set title
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround
set hlsearch
set showmatch
set autoindent
set smartindent
set cindent
set showcmd
set ignorecase
set smartcase
set incsearch
set inccommand=split
set nowrapscan
set incsearch
set nobackup
set noshowmode
set mouse=a
set scrolloff=8
set backspace=indent,eol,start
