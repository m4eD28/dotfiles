command! -bar CR silent !osascript $HOME/.vim/apple_script/chrome_reload.scpt && osascript $HOME/.vim/apple_script/terminal_focus.scpt
command! -bar ChromeStartObserve ChromeStopObserve | autocmd BufWritePost <buffer> ChromeReload
command! -bar ChromeStopObserve autocmd! BufWritePost <buffer>
