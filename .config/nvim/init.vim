" _   _                 _             _       _ _
"| \ | | ___  _____   _(_)_ __ ___   (_)_ __ (_) |_
"|  \| |/ _ \/ _ \ \ / / | '_ ` _ \  | | '_ \| | __|
"| |\  |  __/ (_) \ V /| | | | | | | | | | | | | |_
"|_| \_|\___|\___/ \_/ |_|_| |_| |_| |_|_| |_|_|\__|

if &compatible
  set nocompatible
endif

set runtimepath+=/Users/maedar/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/maedar/.cache/dein')
  call dein#begin('/Users/maedar/.cache/dein')
  " call map(dein#check_clean(), "delete(v:val, 'rf')")

  " Let dein manage dein
  call dein#add('/Users/maedar/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('/Users/maedar/dotfiles/.config/nvim/dein.toml',{'lazy':0})
  call dein#load_toml('/Users/maedar/dotfiles/.config/nvim/dein_lazy.toml',{'lazy':1})

  call dein#end()
  call dein#save_state()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif


"vimをクリップボード連携
set clipboard=unnamed

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

"<C-p>でバッファを保存時に開いてるChromeサイトをReload
command! -bar ChromeReload silent !osascript ~/dotfiles/.config/nvim/apple_script/chrome_reload.applescript
command! -bar ChromeStartObserve ChromeStopObserve | autocmd BufWritePost <buffer> ChromeReload
command! -bar ChromeStopObserve autocmd! BufWritePost <buffer>
nnoremap <silent> <C-p> :ChromeStartObserve<CR>

" 関数の引数で対応するカッコまで消してくれる
nnoremap dm) vmzi)o`zod

" F3でnumber <-> relativenumber
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

" space 二回でその単語をハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" 空行挿入
imap <Down> <End><CR>
imap <Up> <Up><End><CR>
nnoremap <Down> mzo<ESC>`z
nnoremap <Up> mzO<ESC>`z

nmap <silent> <Esc><Esc> :nohlsearch<CR>
nmap <F5> :!ptex2pdf -l % <Enter>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 行を移動
nnoremap <S-Up> "zdd<Up>"zP
nnoremap <S-Down> "zdd"zp
" 複数行を移動
vnoremap <S-Up> "zx<Up>"zP`[V`]
vnoremap <S-Down> "zx"zp`[V`]
vnoremap < <gv
vnoremap > >gv

hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE
scriptencoding=utf-8
set ruler
set cursorline
set colorcolumn=80
set encoding=utf-8
set number
set relativenumber
set title
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set softtabstop=0
set expandtab
set smarttab
set shiftround
set hlsearch
set showmatch
set showcmd
set ignorecase
set smartcase
set incsearch
set inccommand=split
set nowrapscan
set incsearch
set nobackup
set noshowmode
set scrolloff=8
set backspace=indent,eol,start
set noswapfile
