scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#qfsigns_update#new()
	let hook = shabadou#make_hook_command({
\		"config" : {
\			"hook_command" : ":QfsignsUpdate"
\		}
\	})
	return deepcopy(hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
