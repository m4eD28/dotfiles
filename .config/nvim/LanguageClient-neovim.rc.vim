set hidden

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

" 言語ごとに設定する
if executable('clangd')
    " let g:LanguageClient_serverCommands = {
    "     \ 'c' : ['clangd'],
    "     \ 'cpp': ['clangd'],
    "     \ }
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['cpp'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

inoremap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \   "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

nnoremap <Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
