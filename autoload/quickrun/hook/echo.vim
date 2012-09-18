scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! s:make_hook_echo()
	let hook = {
\		"name" : "echo",
\		"kind" : "hook",
\		"config" : {
\			"enable" : 1,
\		}
\	}

	let points = [
\		"hook_loaded",
\		"normalized",
\		"module_loaded",
\		"ready",
\		"output",
\		"success",
\		"failure",
\		"finish",
\		"exit",
\	]

	for point in points
		let hook.config["output_".point] = get(hook.config, "output_".point, "")

		execute ''
\."			function! hook.on_".point."(...)\n"
\."				if !empty(self.config.output_".point.")\n"
\."					echo self.config.output_".point."\n"
\."				endif\n"
\."			endfunction\n"
	endfor
	return hook
endfunction


function! quickrun#hook#echo#new()
	return deepcopy(s:make_hook_echo())
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
