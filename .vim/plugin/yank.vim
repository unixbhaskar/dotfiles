function Osc52Yank()
	let buffer=system('base64', @0)
	let buffer=substitute(buffer,"\n","","")
	let buffer='\e]52;c;'.buffer.'\e\'
	silent exe "!echo -ne " .shellescape(buffer).">".shellescape('/dev/tty')
endfunction

augroup Yank
	autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END