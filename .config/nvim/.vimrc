syntax enable

filetype plugin indent on

set ruler
set encoding=utf-8
scriptencoding=utf-8
set number
set title
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set hlsearch
set showmatch
set cindent
set showcmd
set ignorecase
set smartcase
set nowrapscan
set incsearch
set nobackup
set backspace=indent,eol,start

inoremap {<Enter> {}<Left><CR><ESC><S-o>
"nnoremap <C-b> :copen<Enter>:make<Enter>
"nnoremap <C-u> :copen<Enter>:make run<Enter>
nmap <silent> <Esc><Esc> :nohlsearch<CR>
nmap <F5> :!python % <Enter>
map <C-n> :NERDTreeToggle<CR>

"htmlのカッコ補間
"augroup fileTypeIndent
"    autocmd!
"    autocmd BufNewFile,BufRead *.html inoremap < <><Left>
"augroup END

"colorscheme
set background=dark
colorscheme solarized
let g:lightline = {
    \ 'colorscheme': 'solarized'
    \ }
set laststatus=2

"vimをクリップボード連携
set clipboard+=unnamed

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundle 'ithchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
