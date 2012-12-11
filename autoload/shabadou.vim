let s:save_cpo = &cpo
set cpo&vim


function! shabadou#make_hook_points_module(base)
	let hook = copy(a:base)
	if !has_key(hook, "config")
		let hook.config = {}
	endif

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
		let hook.config["enable_".point] = get(hook.config, "enable_".point, 0)
		let hook.config["priority_".point] = get(hook.config, "priority_".point, 0)

		execute ''
\."			function! hook.on_".point."(...)\n"
\."				if get(self.config, 'enable_'.".string(point).", 0) && has_key(self, 'hook_apply')\n"
\."					call self.hook_apply({ 'point' : '".point."', 'args' : a:000 })\n"
\."				endif\n"
\."			endfunction\n"
	
	endfor

	function! hook.priority(point)
		return get(self.config, "priority_".a:point, 0)
	endfunction
	
	return hook
endfunction


function! shabadou#make_hook_command(base)
	let hook = shabadou#make_hook_points_module(a:base)
	let hook.config.hook_command = get(hook.config, "hook_command", "")
	let hook.config.hook_args    = get(hook.config, "hook_args", "")

	function! hook.hook_apply(...)
		if exists(self.config.hook_command)
			silent execute self.config.hook_command." ".self.config.hook_args
		endif
	endfunction

	return hook
endfunction


function! shabadou#make_quickrun_hook_anim(name, aa_list, wait)
	let hook = {
	\	"name" : a:name,
	\	"kind" : "hook",
	\	"index_counter" : 0,
	\	"aa_list" : a:aa_list,
	\	"config" : {
	\		"wait" : a:wait,
	\		"enable" : 0,
	\		"priority_output" : 0,
	\		"redraw" : 0,
	\	}
	\}

	function! hook.on_ready(session, context)
		let self.index_counter = -2
	endfunction

	function! hook.on_output(session, context)
		let self.index_counter += 1
		if self.index_counter < 0
			return
		endif
		echo self.aa_list[ self.index_counter / self.config.wait % len(self.aa_list) ]
		if self.config.redraw
			redraw
		endif
	endfunction

	function! hook.priority(point)
		return a:point == "output"
	\		? self.config.priority_output
	\		: 0
	endfunction

	return hook
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
