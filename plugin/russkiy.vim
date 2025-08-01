if exists('g:loaded_russkiy')
	finish
endif
let g:loaded_russkiy = 1

command -nargs=1 -complete=customlist,s:russkiy_options Russkiy call s:russkiy_command(<q-args>)

function! s:russkiy_command(command)
	if a:command == 'on'
		call russkiy#on()
	elseif a:command == 'off'
		call russkiy#off()
	else
		echoerr 'Unknown subcommand ' . a:command
	endif
endfunction

function! s:russkiy_options(_, __, ___)
	return ['on', 'off']
endfunction

