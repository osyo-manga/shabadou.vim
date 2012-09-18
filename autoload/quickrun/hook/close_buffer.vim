scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "close_buffer",
\	"kind" : "hook",
\	"is_empty_data" : 1,
\	"config" : {
\		"enable_empty_data" : 0
\	}
\})

function! s:hook.hook_apply(context)
	try
		bwipeout! [quickrun
	catch
	endtry
endfunction

function! s:hook.on_output(session, context)
	if self.config.enable_empty_data
" 		let self.config.enable_exit = empty(a:context.data)
		let self.is_empty_data = self.is_empty_data ? empty(a:context.data) : 0
	endif
endfunction

function! s:hook.on_success(...)
	if self.config.enable_success
		let self.config.enable_exit = self.config.enable_success
	endif
endfunction

function! s:hook.on_failure(...)
	if self.config.enable_failure
		let self.config.enable_exit = 1
	endif
endfunction

function! s:hook.on_exit(...)
	if self.config.enable_exit || (self.config.enable_empty_data && self.is_empty_data)
		call self.hook_apply({ "point" : "exit", "args" : a:000 })
	endif
endfunction


function! quickrun#hook#close_buffer#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
