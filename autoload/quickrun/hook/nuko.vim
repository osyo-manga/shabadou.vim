scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! quickrun#hook#nuko#new()
	return shabadou#make_quickrun_hook_anim(
	\	"nuko",
	\	[
	\      '     (≡ΦωΦ)                ',
	\      '    -(≡ΦωΦ)                ',
	\      '    -=(≡ΦωΦ)               ',
	\      '     -=(≡ーωー)              ',
	\      '    -=≡(≡▼ω▼) ﾇｺｫ…       ',
	\      '     --=≡(≡▼ω▼) ﾇｺｫ…     ',
	\      '       --=≡(≡▼ω▼) ﾇｺｫ…   ',
	\      '          -=≡(≡▼ω▼) ﾇｺｫ… ',
	\      '             -=(≡ーωー)      ',
	\      '             -=(≡ΦωΦ)      ',
	\      '              -(≡ΦωΦ)      ',
	\      '               (≡ΦωΦ)      ',
	\	],
	\	4
	\)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
