if exists('g:loaded_fzf_float') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

lua require("fzf_float")
let g:fzf_layout = { 'window': 'lua NavigationFloatingWin()' }

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_fzf_float = 1
