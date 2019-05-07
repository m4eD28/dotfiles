set hidden

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'c' : ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    \ 'py': ['pyls'],
\ }
"au User lsp_setup call lsp#register_server({
"    \ 'name': 'clangd',
"    \ 'cmd': {server_info->['clangd']},
"    \ 'whitelist': ['cpp'],
"    \ })
" endif

if executable('pyls')
  let g:LanguageClient_serverCommands = {
  \ }

  au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ 'name': 'clangd',
      \ 'cmd': {server_info->['clangd']},
      \ 'whitelist': ['cpp'],
      \ })
  let g:LanguageClient_serverCommands = {
      \ 'python' : ['pyls'],
      \ 'cpp' : ['clangd'],
  \}
endif

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END
set completeopt-=preview
imap <C-k> <Plug>(LanguageClient_expand_or_jump)
smap <C-k> <Plug>(LanguageClient_expand_or_jump)
xmap <C-k> <Plug>(LanguageClient_expand_target)
nnoremap <Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
