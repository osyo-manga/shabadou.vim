scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "back_window",
\	"kind" : "hook",
\	"config" : {
\		"winnr" : 0,
\	}
\})

function! s:hook.init(...)
	let self.config.winnr = self.config.winnr ? self.config.winnr : winnr()
endfunction


function! s:hook.hook_apply(context)
	execute self.config.winnr . "wincmd w"
endfunction


function! quickrun#hook#back_window#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
