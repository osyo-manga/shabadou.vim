scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


let s:hook = {
\	"name" : "vimlint",
\	"kind" : "hook",
\	"config" : {
\		"enable" : 0,
\		"vimlint_path" : "",
\		"vimlparser_path" : "",
\	}
\}


function! s:hook.on_normalized(session, ...)
	if !empty(a:session.config.exec)
		return
	endif

	if empty(self.config.vimlint_path)
		let vimlint = substitute(fnamemodify(globpath(&rtp, "autoload/vimlint.vim"), ":h:h"), '\\', '/', "g")
	else
		let vimlint = self.config.vimlint_path
	endif
	
	if empty(self.config.vimlparser_path)
		let vimlparser = substitute(fnamemodify(globpath(&rtp, "autoload/vimlparser.vim"), ":h:h"), '\\', '/', "g")
	else
		let vimlparser = self.config.vimlparser_path
	endif

	let a:session.config.exec = '%C -N -u NONE -i NONE -V1 -e -s -c "set rtp+=' . vimlparser . ',' . vimlint . '" -c "call vimlint#vimlint(''%s'', {})" -c "qall!"'
endfunction


function! quickrun#hook#vim_vimlint#new()
	return deepcopy(s:hook)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
