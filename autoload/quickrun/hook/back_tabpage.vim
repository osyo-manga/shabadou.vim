scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "back_tabpage",
\	"kind" : "hook",
\	"config" : {
\		"tabpagenr" : 0,
\	}
\})

function! s:hook.init(...)
	let self.config.tabpagenr = self.config.tabpagenr ? self.config.tabpagenr : tabpagenr()
endfunction


function! s:hook.hook_apply(context)
	execute "tabnext" self.config.tabpagenr
endfunction


function! quickrun#hook#back_tabpage#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
