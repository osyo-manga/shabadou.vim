scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#hi_hi_hi_#new()
	return shabadou#make_quickrun_hook_anim(
	\	"hi_hi_hi_",
	\	[
	\		"",
	\		"ﾋｰ!",
	\		"ﾋｰ!ﾋｰ!",
	\		"ﾋｰ!ﾋｰ!ﾋｰ!",
	\	],
	\	10
	\)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
