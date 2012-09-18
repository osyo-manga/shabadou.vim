scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#neco#new()
	return shabadou#make_quickrun_hook_anim(
	\	"neco1",
	\	[
	\		"   A A\n~(-'_'-)",
	\		"        A A\n     ~(-'_'-)",
	\		"           A A\n        ~(-'_'-)",
	\		"              A A\n           ~(-'_'-)",
	\		"                 A A\n              ~(-'_'-)",
	\	],
	\	10
	\)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
