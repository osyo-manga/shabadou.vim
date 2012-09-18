scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "close_quickfix",
\	"kind" : "hook",
\	"config" : {
\		"enable_exit" : 0
\	}
\})

" function! s:hook.priority(point)
" 	return a:point == "exit"
" \		? -999
" \		: 0
" endfunction

function! s:hook.hook_apply(context)
	:cclose
endfunction


function! quickrun#hook#close_quickfix#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
