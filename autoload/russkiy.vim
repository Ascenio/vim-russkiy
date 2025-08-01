function! russkiy#on()
	augroup russkiy
		autocmd!
		autocmd InsertCharPre * call s:replace_char()
	augroup END
endfunction

function! russkiy#off()
	augroup russkiy
		autocmd!
	augroup END
endfunction

function! s:replace_char()
	if !('a' <= v:char && v:char <= 'z' || 'A' <= v:char && v:char <= 'Z')
		return
	endif
	let l:digraph = trim(v:char . '=')
	if strcharlen(l:digraph) == 2
		let v:char = digraph_get(l:digraph)
	endif
endfunction

