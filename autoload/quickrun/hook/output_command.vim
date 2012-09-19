scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "output_command",
\	"kind" : "hook",
\	"config" : {
\		"log" : 0,
\		"wait" : 0
\	}
\})


function! s:hook.hook_apply(context)
	let session = a:context.args[0]
	for command in session.commands
		execute self.config.log ? "echom command" : "echo command"
	endfor
	if self.config.wait
		let n = input("wait...please any input :")
	endif
endfunction


function! quickrun#hook#output_command#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
