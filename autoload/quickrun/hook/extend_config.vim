scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! s:quickrun_config()
	return copy(extend(copy(g:quickrun#default_config), get(g:, "quickrun_config", {})))
endfunction


let s:hook = {
\	"config" : {
\		"enable" : 0,
\		"target" : "",
\		"force" : 0,
\	}
\}


function! s:hook.init(session)
	if self.config.enable
		if empty(self.config.target)
			let self.config.target = substitute(a:session.config.type, '.*/\zs.*\ze', "_", "g")
		endif
		let quickrun_config = s:quickrun_config()
		if has_key(quickrun_config, self.config.target)
			call extend(a:session.config, quickrun_config[self.config.target], (self.config.force ? "force" : "keep"))
		endif
	endif
endfunction


function! quickrun#hook#extend_config#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
