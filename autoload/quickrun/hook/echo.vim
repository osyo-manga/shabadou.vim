scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! s:make_hook_echo()
	let hook = {
\		"name" : "echo",
\		"kind" : "hook",
\		"config" : {
\			"enable" : 0,
\			"enable_output_exit" : 0,
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
		let hook.config["priority_".point] = get(hook.config, "priority_".point, 0)

	execute ''
\."			function! hook.on_".point."(...)\n"
\."				if !empty(self.config.output_".point.")\n"
\."					if empty(self.config.output_exit) && self.config.enable_output_exit\n"
\."						let self.config.output_exit = self.config.output_".point."\n"
\."					else\n"
\."						redraw | echo self.config.output_".point."\n"
\."					endif\n"
\."				endif\n"
\."			endfunction\n"
	endfor
	function! hook.priority(point)
		return get(self.config, "priority_".a:point, 0)
	endfunction

	return hook
endfunction


function! quickrun#hook#echo#new()
	return deepcopy(s:make_hook_echo())
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
