scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "back_buffer",
\	"kind" : "hook",
\	"config" : {
\		"bufnr" : 0,
\	}
\})

function! s:hook.init(...)
	let self.config.bufnr = self.config.bufnr ? self.config.bufnr : bufnr("%")
endfunction

function! s:hook.hook_apply(context)
	execute "buffer" self.config.bufnr
endfunction


function! quickrun#hook#back_buffer#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
