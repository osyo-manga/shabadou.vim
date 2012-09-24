scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:hook = shabadou#make_hook_command({
\	"config" : {
\		"enable_exist_data" : 0,
\		"hook_command" : ":copen"
\	}
\})

function! s:hook.on_output(session, context)
	if self.config.enable_exist_data && !empty(a:context.data)
		let self.config.enable_exit = 1
	endif
endfunction


function! s:hook.on_success(...)
	if self.config.enable_success
		let self.config.enable_exit = 1
	endif
endfunction


function! s:hook.on_failure(...)
	if self.config.enable_failure
		let self.config.enable_exit = 1
	endif
endfunction


function! quickrun#hook#copen#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
