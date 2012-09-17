scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#hier_update#new()
	let hook = s:make_hook_command({
\		"config" : {
\			"enable_exit" : 1,
\			"hook_command" : ":HierUpdate"
\		}
\	})
	return deepcopy(hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo