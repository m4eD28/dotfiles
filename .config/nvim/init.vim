"dein
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('itchyny/lightline.vim')
 call dein#add('scrooloose/nerdtree')
 call dein#add('Townk/vim-autoclose')
 call dein#add('tpope/vim-commentary')
 call dein#add('bronson/vim-trailing-whitespace')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 5
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \   "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"auto-close
" autocmd FileType cpp
    " \ let b:AutoClosePairs = AutoClose#DefaultPairsModified("<>", "")
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"NERDTree
let NERDTreeShowHidden = 1
map <C-n> :NERDTreeToggle<CR>

"htmlのカッコ補完
"augroup fileTypeIndent
"    autocmd!
"    autocmd BufNewFile,BufRead *.html inoremap < <><Left>
"augroup END

"lightline
set background=dark
colorscheme solarized
let g:lightline = {
    \ 'colorscheme': 'solarized'
    \ }
set laststatus=2

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
