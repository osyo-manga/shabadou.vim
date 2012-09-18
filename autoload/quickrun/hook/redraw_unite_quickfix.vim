scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "redraw_unite_quickfix",
\	"kind" : "hook",
\	"config" : {
\		"buffer_name" : "quickrun-hook-unite-quickfix"
\	}
\})


function! s:hook.hook_apply(context)
	let winnr = unite#get_unite_winnr(self.config.buffer_name)
	if winnr != -1
		echom winnr
		call unite#force_redraw(winnr)
	endif
endfunction


" function! s:hook.priority(...)
" 	return 100000
" endfunction


function! quickrun#hook#redraw_unite_quickfix#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
