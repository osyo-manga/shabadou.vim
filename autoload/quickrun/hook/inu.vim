scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#inu#new()
	return shabadou#make_quickrun_hook_anim(
	\	"inu",
	\	[
	\      '     (U＾ω＾)                ',
	\      '    -(U＾ω＾)                ',
	\      '    -=(U＾ω＾)               ',
	\      '     -=(Uーωー)              ',
	\      '    -=≡(U＞ω＜) ｲﾇｩ…       ',
	\      '     --=≡(U＞ω＜) ｲﾇｩ…     ',
	\      '       --=≡(U＞ω＜) ｲﾇｩ…   ',
	\      '          -=≡(U＞ω＜) ｲﾇｩ… ',
	\      '             -=(Uーωー)      ',
	\      '             -=(U＾ω＾)      ',
	\      '              -(U＾ω＾)      ',
	\      '               (U＾ω＾)      ',
	\	],
	\	4
	\)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
