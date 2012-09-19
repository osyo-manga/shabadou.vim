scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "output_config",
\	"kind" : "hook",
\	"config" : {
\		"wait" : 0,
\		"log" : 0,
\	}
\
\})


function! s:hook.hook_apply(context)
	let config = a:context.args[0].config
	if exists(":PP")
		execute (self.config.log ? "PP!" : "PP"). " config"
	else
		echo string(config)
	endif
	if self.config.wait
		let n = input("wait...please any input :")
	endif
endfunction


function! quickrun#hook#output_config#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
