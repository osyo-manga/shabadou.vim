scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#shabadoubi_touch_henshin#new()
	return shabadou#make_quickrun_hook_anim(
	\	"shabadoubi_touch_henshin",
	\	[
	\		"",
	\		"ｼｬﾊﾞﾄﾞｩﾋﾞ",
	\		"ｼｬﾊﾞﾄﾞｩﾋﾞﾀｯﾁ",
	\		"ｼｬﾊﾞﾄﾞｩﾋﾞﾀｯﾁﾍﾝｼｰﾝ!!",
	\	],
	\	10
	\)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
