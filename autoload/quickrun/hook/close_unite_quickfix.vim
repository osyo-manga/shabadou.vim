scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "close_unite_quickfix",
\	"kind" : "hook",
\	"config" : {
\		"buffer_name" : "quickrun-hook-unite-quickfix"
\	}
\})


function! s:hook.hook_apply(context)
	if exists(":UniteClose")
		silent execute ":UniteClose" self.config.buffer_name
	endif
endfunction


function! quickrun#hook#close_unite_quickfix#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
