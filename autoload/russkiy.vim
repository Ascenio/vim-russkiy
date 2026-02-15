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
	augroup! russkiy
endfunction

function! russkiy#toggle()
	let l:groups = split(execute('augroup'), '')
	for l:group in l:groups
		if l:group ==# 'russkiy'
			call russkiy#off()
			return
		endif
	endfor
	call russkiy#on()
endfunction

function! s:replace_char()
	if !('a' <= v:char && v:char <= 'z' || 'A' <= v:char && v:char <= 'Z')
	\ || v:char == 'q'
	\ || v:char == 'w'
	\ || v:char == 'x'
	" Ignore 'q', 'w' and 'x' as they are context dependent
		return
	endif
	let v:char = digraph_get(v:char . '=')
endfunction

