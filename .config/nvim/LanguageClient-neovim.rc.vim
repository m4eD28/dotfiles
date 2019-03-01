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
      \ })
  let g:LanguageClient_serverCommands = {
      \ 'python' : ['pyls'],
  \}
endif

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

nnoremap <Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
