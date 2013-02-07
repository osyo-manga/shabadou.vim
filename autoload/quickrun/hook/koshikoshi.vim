scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#koshikoshi#new()
	return shabadou#make_quickrun_hook_anim(
	\	"koshikoshi",
	\	[
	\		'(＞ワ＜三   )コシコシコシ', '( ＞ワ三＜  )コシコシコシ',
	\		'(  ＞三ワ＜ )コシコシコシ', '(   三＞ワ＜)コシコシコシ',
	\		'(  ＞三ワ＜ )コシコシコシ', '( ＞ワ三＜  )コシコシコシ'
	\	],
	\	4
	\)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
