let g:goyo_width = '100'
let g:goyo_height = '85%'
let g:goyo_linenr = 0

function! s:goyo_enter()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set scrolloff=999
	Limelight
endfunction

function! s:goyo_leave()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	set scrolloff=5
	Limelight!
endfunction

augroup vime_user_plugin_goyo
	autocmd!
	autocmd! User GoyoEnter
	autocmd! User GoyoLeave
	autocmd  User GoyoEnter nested call <SID>goyo_enter()
	autocmd  User GoyoLeave nested call <SID>goyo_leave()
augroup END
