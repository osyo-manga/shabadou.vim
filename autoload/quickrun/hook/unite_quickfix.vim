scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "unite_quickfix",
\	"kind" : "hook",
\	"config" : {
\		"enable_exist_data" : 0,
\		"no_focus" : 0,
\		"unite_options" : "-no-quit -direction=botright -winheight=12 -max-multi-lines=32"
\	}
\})


function! s:hook.on_output(session, context)
	if self.config.enable_exist_data && !empty(a:context.data)
		let self.config.enable_exit = 1
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


function! s:hook.hook_apply(context)
	if exists(":Unite")
		silent execute ":Unite quickfix -buffer-name=quickrun-hook-unite-quickfix "
		\	.self.config.unite_options
		\	.(self.config.no_focus ? " -no-focus " : "")
	endif
endfunction


function! quickrun#hook#unite_quickfix#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
