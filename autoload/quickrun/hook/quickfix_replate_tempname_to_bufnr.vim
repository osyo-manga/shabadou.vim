scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = shabadou#make_hook_points_module({
\	"name" : "quickfix_replate_tempname_to_bufnr",
\	"kind" : "hook",
\	"config" : {
\		"priority" : 0,
\		"bufnr" : 0,
\	},
\})

function! s:hook.init(...)
	let self.config.bufnr = self.config.bufnr ? self.config.bufnr : bufnr("%")
endfunction


function! s:replace_temp_to_bufnr(qf, tempname, bufnr)
	if bufname(a:qf.bufnr) ==# a:tempname
		let a:qf.bufnr = a:bufnr
	endif
	return a:qf
endfunction


function! s:hook.hook_apply(context)
	let session = a:context.args[0]
	if !has_key(session, "_temp_names")
		return
	endif
	let qflist = getqflist()
	let bufnr  = self.config.bufnr
	for tempname in session._temp_names
		call map(qflist, "s:replace_temp_to_bufnr(v:val, tempname, bufnr)")
	endfor
	call setqflist(qflist)
endfunction


function! quickrun#hook#quickfix_replate_tempname_to_bufnr#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
