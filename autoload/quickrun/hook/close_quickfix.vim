scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

" let s:hook = shabadou#make_hook_points_module({
" \	"name" : "close_quickfix",
" \	"kind" : "hook",
" \	"config" : {
" \		"enable_exit" : 0
" \	}
" \})
" 
" function! s:hook.hook_apply(context)
" 	silent :cclose
" endfunction
" 
" 
" 
" function! quickrun#hook#close_quickfix#new()
" 	return deepcopy(s:hook)
" endfunction


function! quickrun#hook#close_quickfix#new()
	let hook = shabadou#make_hook_command({
\		"config" : {
\			"enable_exit" : 1,
\			"hook_command" : ":cclose"
\		}
\	})
	return deepcopy(hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
