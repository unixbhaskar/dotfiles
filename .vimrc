"Author : Bhaskar Chowdhury
"Email  : unixbhaskar@gmail.com
"Default values
scriptencoding utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     "Make indent code based on the file type
syntax on
set path+=**
set noswapfile
set nobackup
set hlsearch
set incsearch
"syntax enable
let g:CommandTMaxFiles=500000
nnoremap <Leader>n :set invnumber number?<CR>
"colorscheme molokai_dark
let g:solarized_term=1
 " let g:solarized_termcolors=256
 " set t_Co=256
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"call togglebg#map("<F12>")
set background=dark
colorscheme solarized
let g:airline_theme='base16_gruvbox_dark_hard'
"Different highlights set background=light
highlight Comment    ctermfg=119
highlight clear SpellBad
highlight SpellBad  cterm=bold ctermbg=9 gui=undercurl guisp=Yellow
"Make the visual selection more prominent
highlight Visual term=bold cterm=bold ctermbg=7 ctermfg=2 guifg=Red guibg=LightBlue
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" PlugIns let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dstein64/vim-startuptime'
Plugin 'vifm/vifm.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'AutoComplPop'
Plugin 'majutsushi/tagbar'
Plugin 'vim-latex/vim-latex'
Plugin 'ying17zi/vim-live-latex-preview'
Plugin 'itchyny/calendar.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'sunaku/vim-shortcut'
Plugin 'tpope/vim-unimpaired'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-titlecase'
Plugin 'svermeulen/vim-macrobatics'
Plugin 'mhinz/vim-startify'
Plugin 'strboul/urlview.vim'
Plugin 'mtth/scratch.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'wincent/command-t'
Plugin 'bash-support.vim'
Plugin 'sudo.vim'
Plugin 'erietz/vim-terminator'
Plugin 'mboughaba/i3config.vim'
Plugin 'jreybert/vimagit'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'axvr/org.vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'vimwiki/vimwiki'
Plugin 'dpelle/vim-LanguageTool'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
filetype plugin indent on    " required
filetype plugin on
"Support vim plugin sourced
source ~/.vim/bundle/vim-shortcut/plugin/shortcut.vim
	"Default bindings

	set laststatus=2
	set showcmd
	set binary
	set noeol
	set ttyfast
	set wildmenu
	set wildmode=longest,full
	set wildmenu wildoptions=pum
	set showbreak=...
	set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ ,nbsp:^
	set number
	set relativenumber
	" Highlight the line with a cursor
	set cursorline
	" Disable cursor line highlighting in Insert mode
	augroup aug_cursor_line
	  au!
	  au InsertEnter * setlocal nocursorline
	  au InsertLeave * setlocal cursorline
	augroup END
	"set spelling
	"set spell spelllang=en
	" Write file with sudo permission with capital W
	command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
	"vim startup time measure
	let g:startuptime_sort = 0
	let g:startuptime_tries = 5
	let g:startuptime_exe_args = ['-u', '~/.vimrc']

	"let loaded_vifm=1
	map<Leader>vv :Vifm<CR>
	" Pop up git commit info box by pressing \g

	let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.wiki\)\='
	Shortcut! Git commit popup messages of the specific line of code by pressing"\g
	 nmap <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

	 "Make leading and trailing space visible

	syn match ErrorLeadSpace /^ \+/         " highlight any leading spaces
	syn match ErrorTailSpace / \+$/         " highlight any trailing spaces
	"match Error80            /\%>80v.\+/    " highlight anything past 80 in red
	"All about indenting

	set autoindent smartindent              " turn on auto/smart indenting
	set smarttab                            " make <tab> and <backspace> smarter
	set backspace=eol,start,indent          " allow backspacing over indent, eol, & start
	"All about Tabs and Spaces

	set noexpandtab                         " use tabs, not spaces
	set tabstop=8                           " tabstops of 8
	set softtabstop=8
	set shiftwidth=8                        " indents of 8
	set textwidth=78                        " screen in 80 columns wide, wrap at 78
	" To make folding work automatically
	"autocmd BufWinLeave *.* mkview
	"autocmd BufWinEnter *.* silent loadview
	" Paste mode toggle by F2
	Shortcut! paste mode on or off
	nnoremap <F2> :set invpaste paste?<CR>
	set pastetoggle=<F2>
	"History of changes showing by undotree plugin
	nnoremap <F3> :UndotreeToggle<CR>
	" Non visible character showing by pressing F4
	Shortcut! showing non visible character by toggle
	nmap <F4> :set list!<CR>
	"Removing trailing whitespace
	nnoremap <F5> :call <SID>StripTrailingWhitespaces()<CR>

	function! <SID>StripTrailingWhitespaces()
	    " Preparation: save last search, and cursor position.
	    let _s=@/
	    let l = line(".")
	    let c = col(".")
	    " Do the business:
	    %s/\s\+$//e
	    " Clean up: restore previous search history, and cursor position
	    let @/=_s
	    call cursor(l, c)
	endfunction

	autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
	" Spelling check toggle by pressing F6
	Shortcut! Spell Checking toggle
	map <silent><F6> :setlocal spell! spelllang=en_us<CR>
	"Tabs manipulation vim -p filename1 filename2... from cli
	set switchbuf=usetab
	nnoremap <F7> :sbnext<CR>
	nnoremap <S-F7> :sbprevious<CR>
	nnoremap <C-Left> :tabprevious<CR>
	nnoremap <C-Right> :tabnext<CR>
	"Tagbar to work
	 nmap <F8> :TagbarToggle<CR>
	 "Fold toggle by F9

	inoremap <F9> <C-O>za
	nnoremap <F9> za
	onoremap <F9> <C-C>za
	vnoremap <F9> zf
	 "Search replaces n number of times
	nnoremap sr :normal n.<CR>
	"Open URI under cursor by pressing ob and os
	 nmap ob :exe 'silent !vimb'<C-r><C-l><CR>
	 "Open selected URI.
	 vmap os :exe 'silent !vimb %'<CR>
	 "Titlecase plugins

	nmap <leader>tc <Plug>Titlecase
	vmap <leader>tc <Plug>Titlecase
	nmap <leader>tT <Plug>TitlecaseLine
	"Open a terminal inside vim
	noremap <silent><leader>te :botright vertical terminal<CR>
	"Tim pope commentrary plugins for comment in file
	autocmd FileType sh setlocal commentstring=#\ %s
	autocmd FileType cpp,cs,java setlocal commentstring=//\ %s
	autocmd FileType c setlocal commentstring=/*\ %s
	autocmd FileType vim setlocal commentstring=\"\ %s
	autocmd FileType lisp setlocal commentstring=\;;;\ %s
	"Google calendar process
	let g:calendar_google_calendar = 1
	let g:calendar_google_task = 1
	let g:calendar_google_event = 1
	let g:calendar_event_start_time= 1
	"let g:calendar_frame = 'default'
	source ~/.cache/calendar.vim/credentials.vim
	"Auto command for configuration file modification/change notification
	augroup configfilealert
	"au!
	autocmd BufWritePost .bashrc !notify_config_file_updates
	autocmd BufWritePost .vimrc !notify_config_file_updates
	"autocmd BufWritePost .gitconfig !notify_config_file_updates
	autocmd BufWritePost .muttrc !notify_config_file_updates
	autocmd BufWritePost .profile !notify_config_file_updates
	autocmd BufWritePost .ithreeconfig !notify_config_file_updates
	autocmd BufWritePost .ithreeblocksconfig !notify_config_file_updates
	autocmd BufWritePost  screenrc !notify_config_file_updates
	autocmd BufWritePost  .vimb_config !copy_vimb_config
	autocmd BufWritePost  .emacs !notify_config_file_updates
	autocmd BufWritePost  .newsboat_config !copy_newsboat_config
	autocmd BufWritePost  .orgemacs !notify_config_file_updates
	autocmd BufWritePost  .orgithreeconfig !notify_config_file_updates
	autocmd BufWritePost  .nyxt_config.lisp !notify_config_file_updates
	autocmd BufWritePost   ~/bin/my_yt_videos !video_file_update.sh
	augroup END

	nnoremap <C-H> <C-W><C-H>
	nnoremap <C-j> <C-w><C-j>
	nnoremap <C-k> <C-w><C-k>
	nnoremap <C-l> <C-w><C-l>

	Shortcut! "vimrc vertical split for quick reference ;vr"
	nnoremap <localleader>vr :vsplit ~/.vimrc<cr>

	Shortcut! "Vimrc reload After editing by ;sv"
	nnoremap <leader>sv :source ~/.vimrc<cr>

	Shortcut! "Abbreviate to insert email address with a shortcut @@ ,to insert author with a shortcut au, to insert date type dts"
	iabbrev @@    unixbhaskar@gmail.com
	iabbrev au    Bhaskar Chowdhury
	iabbrev <expr> dts strftime("%c")
	iabbrev ws  https://github.com/unixbhaskar
	"Auto loading .vimrc once saved
	if has('autocmd')
	    augroup reload_vimrc
		autocmd!
		autocmd! BufWritePost ~/.vimrc nested source %
	    augroup END
	endif
	"Auto loading .bashrc once saved
	if has('autocmd')
	    augroup reload_bashrc
		autocmd!
		autocmd! BufWritePost ~/.bashrc nested source %
	    augroup END
	endif
	"conditionally auto creating directory if it is not exists.

	augroup AutoMkdir
	    autocmd!
	    autocmd  BufNewFile  *  :call EnsureDirExists()
	augroup END
	function! EnsureDirExists ()
	    let required_dir = expand("%:h")
	    if !isdirectory(required_dir)
		call AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")

		try
		    call mkdir( required_dir, 'p' )
		catch
		    call AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
		endtry
	    endif
	endfunction

	function! AskQuit (msg, proposed_action)
	    if confirm(a:msg, "&Quit?\n" . a:proposed_action) == 1
		exit
	    endif
	endfunction
	"fzf related customization

	let $FZF_DEFAULT_OPTS .= ' --inline-info'

	Shortcut! ":Files invoked by <C-f> bring up the fuzzy finder"
	 map <C-f> <Esc><Esc>:Files!<CR>
	Shortcut! ":Blines invoked by <C-f><<Esc><Esc>  in file and go to chosen line"
	inoremap <C-f> <Esc><Esc>:Blines!<CR>

	" Always enable preview window on the right with 60% width
	let g:fzf_preview_window = 'right:60%'

	" [Buffers] Jump to the existing window if possible
	let g:fzf_buffers_jump = 1
	" [[B]Commits] Customize the options used by 'git log':
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	" [Tags] Command to generate tags file
	let g:fzf_tags_command = 'ctags -R'
	Shortcut! "Mapping selecting mappings \<tab>"
	nmap <localleader><tab> <plug>(fzf-maps-n)
	xmap <localleader><tab> <plug>(fzf-maps-x)
	omap <localleader><tab> <plug>(fzf-maps-o)
	Shortcut! "Insert mode completion <c-x><c-k> for word, <c-x><c-f> file path, <c-x><c-l> for lines"
	imap <c-x><c-k> <plug>(fzf-complete-word)
	imap <c-x><c-f> <plug>(fzf-complete-path)
	imap <c-x><c-l> <plug>(fzf-complete-line)
	" Word completion with custom spec with popup layout option
	inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': {'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

	Shortcut! "Visual mode selection move up and down <C-j> and <C-k>"

	"autocmd VimEnter * vunmap <C-j>
	vmap <C-k> [egv
	vmap <C-j> ]egv

	"Convert `` to $() in code
	 map <leader>cq  :%s/`\([^`]*\)`/$(\1)/g<CR>

	 "All about macros ..vim-microbastic plugin

	let g:Mac_NamedMacroFileExtension = '.vimmacro'
	let g:Mac_NamedMacrosDirectory = "~/.vim/macrobatics"
	" Start the macro by pressing q and end with pressing gq
	nmap <nowait> q <plug>(Mac_Play)
	nmap <nowait> gq <plug>(Mac_RecordNew)
	"Navigating macros history
	nmap <leader>mh :DisplayMacroHistory<cr>
	nmap [m <plug>(Mac_RotateBack)
	nmap ]m <plug>(Mac_RotateForward)
	"Macro append and macro prepend
	nmap <leader>ma <plug>(Mac_Append)
	nmap <leader>mp <plug>(Mac_Prepend)
	"Named macros
	nmap <leader>mn <plug>(Mac_NameCurrentMacro)
	"Macro execute
	nmap <leader>me <plug>(Mac_SearchForNamedMacroAndPlay)
	"Macro select
	nmap <leader>ms <plug>(Mac_SearchForNamedMacroAndSelect)
	"Macro overwrite
	nmap <leader>mo <plug>(Mac_SearchForNamedMacroAndOverwrite)
	"Delete a macro

	nmap <leader>md <plug>(Mac_SearchForNamedMacroAndDelete)
	"Rename a macro

	nmap <leader>mr <plug>(Mac_SearchForNamedMacroAndRename)
	"Name macro for global use

	nmap <leader>mng <plug>(Mac_NameCurrentMacro)
	"Name macro for file type

	nmap <leader>mnf <plug>(Mac_NameCurrentMacroForFileType)
	"Macro copy

	nmap <leader>mc <plug>(Mac_CopyCurrentMacroToRegister)
	"Shortcut show shortcut menu and run chosen shortcut
	let mapleader=";"

	Shortcut for shortcuts to work in vim
	       \ noremap <silent> <Leader><Leader> :Shortcuts<Return>

	Shortcut fallback to shortcut menu on partial entry
				 \ noremap <silent> <Leader> :Shortcuts<Return>

	Shortcut! Paste mode toggle by pressing F2

	Shortcut! SelectEntireBuffer  aa in normal mode

	Shortcut! BackupCurrentFile   BB in normal mode

	Shortcut! GitCommit popup messages of the specific line of code by pressing  \g

	Shortcut! Tagbar to toggle by  F8

	Shortcut! NerdTree to open by pressing C-n

	Shortcut! BrowserOpen for under cursor url by pressing "ob" in normal mode

	Shortcut! UrlSelect  open the url by pressing quickly "os" in normal mode

	Shortcut! SpellChecking toggle by pressing F6

	Shortcut! SplitWindow move between by pressing  C-h C-j C-K C-l

	Shortcut! :Files bring up the fuzzy finder and aslo possible by  C-f

	Shortcut! :Blines bring up the fuzzy finder

	Shortcut! TabsManaged by F7 and Shift-F7 and CTRL-> CTRL<-

	Shortcut! Calendar to show by write Calendar at : prompt

	Shortcut! Autocomplete suggestions select by pressing CTRL+Shift+n

	Shortcut! GitHubBrowse if you run "!hub browse" from : this promt inside git repo,it will open the repo page in GitHub

	Shortcut! LaTexOpenPDF for live review by pressing \p in normal mode

	Shortcut! LaTexCompile just press \ll  might not get feedback of this command,bacasue it worked in the background

	Shortcut! LaTexPrevOnOff  toggle by pressing \o in normal mode

	Shortcut! MovingAroundLongSentences  () search end of statement i.e for period and then w and b to move forward and backword fast

	Shortcut! LongSentenceManeuver  gj and gk are for moving up and down in long sentences breaks up several lines long

	Shortcut! ParagraphMovement   { this and this } jump between paragraphs

	Shortcut! InsertEmail  in the insert mode type "@@" without quote

	Shortcut! SelectVisually  Capital V will select entire line

	Shortcut! ShowInVisibleChar by pressing <F4>

	Shortcut! RemoveTrailingWhiteSpace by pressing <F5>

	Shortcut! UndoLiveUpdateWindow by pressing <F3> in normal mode

	Shortcut! FoldBehavior by using zf=create  zi=open and za and zM and zv

	Shortcut! ToCopyLine use :<lineno>t<dot> for current cursor position

	Shortcut! RepeatReplaceNtimes by preseeing Q in normal mode

	Shortcut! CommentOut   gcc =for singleline gc =for bunch of lines gcap =for paragraph range(7,17)gc

	Shortcut! LineMoveUpDown   [e =  move up ]e =move down [p =put above [p =put down

	Shortcut! VifmFileManager  ;vv to open in place

	Shortcut! UPPERCASELINE  gUU and guu for lowercase

	Shortcut! ValueOfChar   ga : display hex, ascii value of character under cursor

	Shortcut! HexValueUTF-8  g8 : display hex value of utf-8 character under cursor

	Shortcut! RemoveBlankLines use this :g/^$/d  or this :v/./d

	Shortcut! PrintCurrentFileName  In the insert mode " C-R %

	Shortcut! HelpFind  helpgrep <anyterm> then use cn,cp,cl

	Shortcut! Surround  cs(existing)(replace) ,full word cst(delimit) ,yss("') to quote sentence,ysiw,yssb ds=to delete

	Shortcut! TitleCase  tc in normal and visual mode and tT for All The Words Inline

	Shortcut! Macros  gq to start , q to play, mh to history,ma to append, mp to prepend, me to execute, ms to select, mo to overwrite,md to delete,mr to rename, mng to global,mnf for filetype,mc to copy, to stop gq

	Shortcut! TerminalOpen To open up a terminal inside it press \te

	Shortcut! ReplaceBacktickTO$()   Run this \cq

	Shortcut! MoveSelectInVisualMode  use CTRL-j and CTRL-k  in visual mode

	Shortcut! FoldToggle   F9

	Shortcut! ColorSchemeToggle  F10

	Shortcut! WindowManipulationKeys   2-> 3-> exchange buffer with directionkey ,5 & 6 -> with direction key, 4 plus arrow key target tab,;z maximise window,\B detach all

	Shortcut! AckSearch     ;a will promp ,t to open in tab ,o to open , go to preview file,T open in tab but no move there

	Shortcut! BashSupportCaseEsac    \sc
	Shortcut! BashSupportElifThen    \sl
	Shortcut! BashSupportForInDoDoneLoop \sf
	Shortcut! BashSupportFor((..))DoDone  \sfo
	Shortcut! BashSupportIfFi             \si
	Shortcut! BashSupportIfThenElseIf     \sie
	Shortcut! BashSupportSelectInDoDone    \ss
	Shortcut! BashSupportUntilDoDone       \st
	Shortcut! BashSupportWhileDoDone       \sw
	Shortcut! BashSupportFunction          \sfu
	Shortcut! BashSupportEcho              \se
	Shortcut! BashSupportPrintf            \sp
	Shortcut! BashSupportFunctionHeder     \cfu
	Shortcut! BashSupportKeyboardBUG        \ckb
	Shortcut! BashSupportKeyBoardTODO      \ckt
	Shortcut! MoveToLastChangeSpot         g; = forward move and g,= backward move to last changes
	Shortcut! ChnagesAndJumps              :changes = show the chnage made ;  :Jump = show where we jump to made changes; CTRL-o jump on the changes backward; CTRL-i frwd
	Shortcut! WordsLinesRegionExchange      cx is default prefix , cxx for current line , X in visual mode , cxc clear out the mark
	Shortcut! Scratchpad                    gs in normal mode and insert mode and gS in visual mode
	Shortcut! WindowManagementKeys          whs=for horizontal split wvs=for vertical split wc=for window close


	"Vim-terminator plugins keybindings
	Shortcut! OpenTerminal                  ;ot
	Shortcut! OpenARepl                     ;or
	Shortcut! RunsCurrentFile               ;rf
	Shortcut! RunsSelectionOnTerminal       ;rt
	Shortcut! StopRunningJobs               ;rs
	Shortcut! SendVisualSelectionToTerm     ;ss
	Shortcut! SendTextInDelimiterToTerm     ;sd
	"View save and restore plugin
	set viewoptions=cursor,folds,slash,unix
	Plugin 'restore_view.vim'
	"Alternative colors scheme by pressing F10 next scheme,shift+F10 previous scheme, Alt+F10 is random scheme
	source  ~/.vim/bundle/setcolors.vim
	" vim window manipulation plugin
	Plugin 'yaronkh/vim-winmanip'

	"nmap <silent> 1<Right> <Plug>(JumpRight)"
	"nmap 1<Left> <Plug>(JumpLeft)"
	"nmap 1<Down> <Plug>(JumpDown)"
	"nmap 1<Up> <Plug>(JumpUp)"

	"nmap 2<Right> <Plug>(MoveBufRight)"
	"nmap 2<Left> <Plug>(MoveBufLeft)"
	"nmap 2<Down> <Plug>(MoveBufDown)"
	"nmap 2<Up> <Plug>(MoveBufUp)"

	"nmap 3<Right> <Plug>(MoveJumpBufRight)"
	"nmap 3<Left> <Plug>(MoveJumpBufLeft)"
	"nmap 3<Down> <Plug>(MoveJumpBufDown)"
	"nmap 3<Up> <Plug>(MoveJumpBufUp)"

	"nmap 4<Right> <Plug>(MoveWinToNextTab)"
	"nmap 4<Left> <Plug>(MoveWinToPrevTab)"

	"nmap 5<Right> <Plug>(CopyBufRight)"
	"nmap 5<Left> <Plug>(CopyBufLeft)"
	"nmap 5<Down> <Plug>(CopyBufDown)"
	"nmap 5<Up> <Plug>(CopyBufUp)"

	"nmap 6<Right> <Plug>(CopyJumpBufRight)"
	"nmap 6<Left> <Plug>(CopyJumpBufLeft)"
	"nmap 6<Down> <Plug>(CopyJumpBufDown)"
	"nmap 6<Up> <Plug>(CopyJumpBufUp)"

	nmap <leader>z <Plug>(MaximizeWin)"

	nmap <silent> <Leader>c <Plug>(ClearAllW"indows)
	"nmap <silent> <Leader>b <Plug>(ClearBuff"erList)
	"Ack search plugin
	Plugin 'mileszs/ack.vim'
	cnoreabbrev Ack Ack!
	nnoremap <Leader>a :Ack!<Space>
	" Vim exchange plugin to help exchnage words and regions
	Plugin 'tommcdo/vim-exchange'
	" Urlview key binding /u
	 nnoremap <silent> <leader>u :Urlview<CR>
	 " Automated log for file modification with the user who did it
	"autocmd BufWritePost  *  !echo "$USER modified the file '%:p' at '$(date)'" >> /tmp/vimlog
	autocmd BufWritePost  ~/Notes/*.md  echo "In the background, it is generating pdf and html files from this file...please wait.."
	" Vimgrep/lvimgrep search quickfix window open
	 augroup quickfixwindow
	    autocmd!
	    autocmd QuickFixCmdPost [^l]* cwindow
	    autocmd QuickFixCmdPost l*    lwindow
	augroup END
	" i3 config syntax detection method
	aug i3config_ft_detection
	  au!
	  au BufEnter,BufRead ~/.ithreeconfig set filetype=i3config
	  au BufEnter,BufRead ~/.ithreeblocksconfig set filetype=i3config
	aug end
	" Make vaa select the entire file...
	xmap aa VGo1G
	" Back up the current file
	nmap BB  :!backup_file %<CR><CR>:echomsg "Backed up with date appended" expand('%')<CR>
	" Automate shell shebang with a keystroke
	 iab hs #!/bin/sh
	 iab hb #!/usr/bin/env bash
	 "[ Show help files in a new tab, plus add a shortcut for helpg ]

	let g:help_in_tabs = 1

	nmap <silent>H  :let g:help_in_tabs = !g:help_in_tabs<CR>

	"Only apply to .txt files...
	augroup HelpInTabs
	    autocmd!
	    autocmd BufEnter  *.txt   call HelpInNewTab()
	augroup END

	"Only apply to help files...
	function! HelpInNewTab ()
	    if &buftype == 'help' && g:help_in_tabs
		"Convert the help window to a tab...
		execute "normal \<C-W>T"
	    endif
	endfunction
	nmap <Leader>ht :Helptags<CR>
	nmap <Leader>hg :helpgrep  <Left>
	"[ Correct common mistypings in-the-fly ]
	iab    netowrk network
	iab    retrun  return
	iab     pritn  print
	iab       teh  the
	iab      liek  like
	iab  liekwise  likewise
	iab      Pelr  Perl
	iab      pelr  perl
	iab        ;t  't
	iab      moer  more
	iab  previosu  previous
	iab  chnages   changes
	"Set to automatically load when the file is changed
	set autoread
	" Focus on a particular window(w),open buffer(b) list,open histrory(h),open registers(r)
	noremap <leader>w :Windows<cr>
	nnoremap <leader>b :Buffers<cr>
	nnoremap <leader>h :History<cr>
	nnoremap <leader>r :registers<cr>
	" Quote a word by pressing leader and double quote
	nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
	" TaskWarrior
	Plugin 'farseer90718/vim-taskwarrior'
	" Tab should not expand in MAKE file
	au FileType make setlocal noexpandtab
	" Perform a macro and save the last macro to g:LastMacro.
	let g:LastMacro = ''
	function! DoMacroSave()
	    let l:macro = getchar()
	    if l:macro =~ '^\d\+$'
		let l:macro = nr2char(l:macro)
	    endif
	    if l:macro != '@'
		let g:LastMacro = '@' .l:macro
	    endif
	    exec 'normal! @' . l:macro
	endfunction
	nnoremap <silent> @ :call DoMacroSave()<CR>
	" Markdown syntax embedded source highlight
	 let g:markdown_fenced_languages = [ 'vim','ruby' ]
	" Cscope db connection
	cs add $CSCOPE_DB
	" Cscope with quickfix window
	 source /home/bhaskar/.vim/bundle/cscope_quickfix.vim
	" Cscope popup menu
	 let Cscope_PopupMenu = 1
	" allow filtering of quickfix/location list window results
	" :help cfilter-plugin
	:packadd cfilter
	"Custom keyword highlights
	"#augroup myTodo
	"#	  autocmd!
	"#	    autocmd Syntax * syntax match myTodo /\v\_.<(TODO|FIXME).*/#!/bin/sh=s+1 containedin=.*Comment
	"#    augroup END
	"#
	"#    highlight link myTodo Todo
	" Markdown
	" Treat all .md files as markdown
	autocmd BufNewFile,BufRead *.md,*.markdown set filetype=markdown
	" Hide and format markdown elements like **bold**
	autocmd FileType markdown set conceallevel=2
	let g:vim_markdown_conceal = 2
	let g:vim_markdown_conceal_code_blocks = 0
	let g:vim_markdown_math = 1
	let g:vim_markdown_toml_frontmatter = 1
	let g:vim_markdown_frontmatter = 1
	let g:vim_markdown_strikethrough = 1
	let g:vim_markdown_autowrite = 1
	let g:vim_markdown_edit_url_in = 'tab'
	let g:vim_markdown_follow_anchor = 1
	":syn clear mkdLineBreak -- end of line space
	"Markdown previewer by using glow
	function! PreviewerMarkdown()
	  let l:path=expand('%:p')
	  silent execute "!echo ".l:path." > ~/.lastpreview.log"
	  :execute "bel vert terminal"
	endfunction
	nmap <Leader>mk : call PreviewerMarkdown()<CR>clear<CR>glow -p $(cat ~/.lastpreview.log)<CR>
	" Buffer manipulation
	" Previous buffer
	nnoremap <Leader>p :b#<CR>
	" Next Buffer
	nnoremap <Leader>n :bn<CR>
	" Close Buffer
	nnoremap <silent> Q :bd!<CR>
	" reload files changed outside vim
	set autoread
	" Triger `autoread` when files changes on disk
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	" Notification after file change
	autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
	"shortcut ;cc to compile/run current filetype
	map <leader>cc :call CompileRunGcc()<CR>
	func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
	exec "!clear && gcc % -o %< && echo COMPILED"
	exec "!clear && time ./%<"
	elseif &filetype == 'cpp'
	exec "!clear && g++ % -o %< && echo COMPILED"
	exec "!clear && time ./%<"
	elseif expand('%:t') == 'main.rs'
	exec "!clear && cargo build --manifest-path=%:p:h:h/Cargo.toml && echo COMPILED"
	exec "!time && cargo run --manifest-path=%:p:h:h/Cargo.toml"
	elseif &filetype == 'rust'
	exec "!clear && rustc %:p --out-dir=%:p:h && echo COMPILED"
	exec "!time " .expand("%:p:r")
	elseif &filetype == 'java'
	exec "!clear && javac % && echo COMPILED"
	exec "!clear && time java -cp %:p:h %:t:r"
	elseif &filetype == 'sh'
	exec "!clear && time bash %"
	elseif &filetype == 'text'
	exec "!clear && echo 'words : ' && wc -w % && echo 'lines : ' && wc -l % && echo 'size : ' && du -h %"
	elseif &filetype == 'asm'
	exec "!clear && time nasm -f elf64 % && echo ASSEMBLED"
	exec "!clear && ld -s -o %:r \"%:r.o\" && echo LINKING"
	exec "!clear && echo RUNNING && \.\/%:r"
	elseif &filetype == 'javascript'
	exec "!clear && time node %"
	elseif &filetype == 'html'
	exec "!chromium % &"
	elseif &filetype == 'go'
	exec "!go build %< && echo COMPILED"
	exec "!clear && time go run %"
	endif
	endfunc
	" Global search and replace prompt by pressing ;;
	noremap ;; :%s:::g<Left><Left><Left>
	"noremap ;' :%s:::cg<Left><Left><Left><Left>"
	"cmap \\ \(\)<Left>

	"Markdown file creation <S-m>
	map <S-m> :e .md<Left><Left><Left>
	" File type detection for ssh known_host file
	au BufNewFile,BufRead known_hosts setfiletype sshknownhost
	 "Capture register value with AR <C-r>=
	 imap AR <C-R>=<S-Right>
	" Autocomple brackets and quotation pair

	" inoremap ( ()<ESC>i

	" inoremap ) <c-r>=ClosePair(')')<CR>

	" inoremap { {<CR>}<ESC>O

	" inoremap } <c-r>=ClosePair('}')<CR>

	" inoremap [ []<ESC>i

	" inoremap ] <c-r>=ClosePair(']')<CR>

	" inoremap " ""<ESC>i
	" inoremap ' ''<ESC>i

	" function! ClosePair(char)
	"     if getline('.')[col('.') - 1] == a:char
	"         return "\<Right>"
	"     else
	"         return a:char
	"     endif
	" endfunction
	"Change colorscheme as per the timing
	" let hr = (strftime('%H'))
	" if hr >= 17
	"          colorscheme molokai_dark
	" elseif hr >= 6
	" 	colorscheme solarized
	" elseif hr >= 0
	"          colorscheme molokai_dark
	" endif
	" Template for source the code block skeleton
	function! LispBlock()
		r~/.vim/templates/lispblock
	endfunction
	nmap <Leader>l :call LispBlock()<CR>

	function! CopyLeft()
		r~/.vim/templates/copyleft
	endfunction

	nmap <Leader>cl :call CopyLeft()<CR>

	function! MarkDownBlock()
		r~/.vim/templates/markdownblock
	endfunction
	nmap <Leader>k :call MarkDownBlock()<CR>

	function! NotesRefBlock()
		r~/.vim/templates/notesref
	endfunction
	nmap <Leader>no :call NotesRefBlock()<CR>

	function! Ebuildsourcecompile()
		r~/.vim/templates/ebuildsourecompile
	endfunction
	nmap <Leader>eb :call Ebuildsourcecompile()<CR>
	" Enlist match and replace in a buffer
	" map <S-r> :g//#|s///g|#
	" Vimgrep invocation by pressing ;g
	 nnoremap <Leader>g :vimgrep //j  *<Left><Left><Left><Left><Left>
	" Swank start
	"let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp &'
	" Close all buffer at once <Leader>q
	 nmap <Leader>q :qall<CR>
	" Write to all the buffer
	 nmap <Leader>wa :wall<CR>
	 " Becasue Backspace is broken..so this will fix it
	  " func Backspace()
	  " if col('.') == 1
	  "   if line('.')  != 1
	  "     return  "\<ESC>Dk$p\<S-J>i"
	  "   else
	  "     return ""
	  "   endif
	  " else
	  "   return "\<Left>\<Del>"
	  " endif
	" endfunc
	" inoremap <BS> <c-r>=Backspace()<CR>
	" Floating term
	 let g:floaterm_keymap_new = '<Leader>f'
	 let g:floaterm_keymap_toggle = '<Leader>ft'
	 let g:floaterm_keymap_prev = '<Leader>fp'
	 let g:floaterm_keymap_next = '<Leader>fn'
	 let g:floaterm_keymap_kill = '<Leader>fk'
	 " Vertical split ;v and normal split ;s
	 nnoremap <Leader>v :vnew<CR>
	 nnoremap <Leader>s :split<CR>
	 " Change directory ;d
	function! ChangeDirectory (newpath)
	  if isdirectory(a:newpath)
	    :execute "lcd " . a:newpath
	  else
	    let dirname = fnamemodify(a:newpath, ":h")
	    :execute "lcd " . dirname
	  endif
	endfunction

	command! -nargs=1 -complete=file ChangeDir :call ChangeDirectory("<args>")
	nnoremap <Leader>d :ChangeDir<space>
	" Auto Pairs
	 Plugin 'jiangmiao/auto-pairs'
	let g:AutoPairsFlyMode = 1
	" Set Dictionary
	"set dictionary=~/.vim/spell/dictionary_word
	Shortcut! DictionaryCompletion  <C-]>
	inoremap <C-]> <C-X><C-K>
	" Vim Mergetool
	Plugin 'samoshkin/vim-mergetool'
	let g:mergetool_layout = 'mr'
	let g:mergetool_prefer_revision = 'local'
	nmap <leader>mt <plug>(MergetoolToggle)
	nnoremap <silent> <leader>mb :call mergetool#toggle_layout('mr,b')<CR>
	nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
	nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
	nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
	nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'
	" Vim Bookmark
	Plugin 'MattesGroeger/vim-bookmarks'
	" Take away the default bookmark binds
	 let g:bookmark_no_default_key_mappings = 1

	 " New key binds for booksmarks
	nmap <Leader>bt <Plug>BookmarkToggle
	nmap <Leader>ba <Plug>BookmarkAnnotate
	nmap <Leader>bs <Plug>BookmarkShowAll
	" nmap <Leader>bn <Plug>BookmarkNext
	" nmap <Leader>bp <Plug>BookmarkPrev
	nmap <Leader>bc <Plug>BookmarkClear
	nmap <Leader>bx <Plug>BookmarkClearAll
	nmap <Leader>bu <Plug>BookmarkMoveUp
	nmap <Leader>bd <Plug>BookmarkMoveDown
	nmap <Leader>bl <Plug>BookmarkMoveToLine
	"Change name
	Shortcut! change_name ;cn
	nmap <Leader>cn :saveas <C-R>%<C-b><S-Right><Right><Right><Right><Right><Right><Right><Right>_<Left>
	" Save file with different name
	"Shortcut! SaveFileWithDifferentName ;sdn
	"nmap <Leader>sdn :saveas! <C-R>%
	"Change into new filename
	"Shortcut! ChangedToNewlyNamedFile ;ec
	"nmap <Leader>ec :e#<CR><CR>:echomsg "Changed into the newly named file" expand('%')<CR>
	" List oldfiles
	 Shortcut! ListOldFilesAndSelect  ;of
	 nmap <leader>of :browse oldfiles<CR>
	 " Justify text by selecting the text and press _j
	 Shortcut! JustifyText  First select the texts and then press _j
	  packadd! justify
	 " Take backup of important files before doing any change
	augroup dotfiles
	 autocmd BufEnter .emacs  :silent normal BB<CR>
	 autocmd BufEnter .vimrc  :silent normal BB<CR>
	 autocmd BufEnter .bashrc  :silent normal BB<CR>
	 autocmd BufEnter .muttrc  :silent normal BB<CR>
	 autocmd BufEnter .gitconfig  :silent normal BB<CR>
	 autocmd BufEnter .ithreeconfig  :silent normal BB<CR>
	 autocmd BufEnter .ithreeblocksconfig  :silent normal BB<CR>
	 autocmd BufEnter .procmailrc  :silent normal BB<CR>
	 autocmd BufEnter .forward  :silent normal BB<CR>
	 autocmd BufEnter .mbsyncrc  :silent normal BB<CR>
	 augroup END
	 " From the cursor point to the end of line yank by Y
	  nnoremap Y y$
	" TaskWarrior keys
	Shortcut! TW [args]             task [filter report arguments]
	Shortcut! TWUndo                undo the previous modification
	Shortcut! TWEditTaskrc          edit ~/.taskrc
	Shortcut! TWEditVitrc           edit ~/.vitrc
	Shortcut! TWDeleteCompleted     clear all completed tasks
	Shortcut! TWAdd                 add new tasks interactively
	Shortcut! TWAnnotate            add an annotation
	Shortcut! TWComplete            mark task done
	Shortcut! TWDelete              deleta a task
	Shortcut! TWDeleteAnnotation    delete an annotation
	Shortcut! TWModifyInteractive   make changes to a task interactively (use with caution!)
	Shortcut! TWReportInfo          run the info report
	Shortcut! TWReportSort [args]   overide the sort method, reset to default if no arguments passed
	Shortcut! TWSync                synchronise with taskd server
	Shortcut! TWToggleReadonly      toggle readonly option
	Shortcut! TWToggleHLField       toggle highlight field option
	Shortcut! TWHistory             list history records using unite.vim
	Shortcut! TWHistoryClear        clear history
	Shortcut! TWBookmark            list bookmarks using unite.vim
	Shortcut! TWBookmarkClear       clear bookmarks
	Shortcut! TW_Annotation		  A        add annotation
	Shortcut! TW_DeleteAnno		  X       delete annotation.
	Shortcut! TW_Add_UDA		  a       add uda attribute
	Shortcut! TW_Del_UDA		  x       delete uda attribute under cursor
	Shortcut! TW_OP_AmoFile		  o       open the annotation as a file.
	Shortcut! TW_New_Tsk		  a       create new task.
	Shortcut! TW_Set_cur		  d       set the task in current line done.
	Shortcut! TW_Delete		  D       delete field/annotation/task
	Shortcut! TW_Sel_CurTsk		  s       select/remove current task to selected list
	Shortcut! TW_ModCurFld		  m       modify current field.
	Shortcut! TW_ModCurTask 	 M       modify current task.
	Shortcut! TW_ChngFilter 	 f       change filter
	Shortcut! TW_ChngReport 	 r       change report type
	Shortcut! TW_SelCurTask 	 c       execute a command for selected tasks/current task
	Shortcut! TW_RefreshRep 	 R       refresh the report/clear selected list
	Shortcut! TW_QuitBuffer 	 q       quit buffer.
	Shortcut! TW_ClrAllComT 	 X       clear all completed task.
	Shortcut! TW_DupSelTask 	 p       duplicate selected tasks
	Shortcut! TW_UndolastChng 	 u       undo last change.
	Shortcut! TW_StartTask  	 +       start task
	Shortcut! TW_StopTask   	 -       stop task
	Shortcut! TW_SyncServer 	 S       sync with taskd server.
	Shortcut! TW_SortByColm 	 s       sort by this column primarily.(if already of the highest priority then switch the polarity)
	Shortcut! TW_SortColIncrs 	 <       sort by this column increasingly.(if already increasingly then increase its priority)
	Shortcut! TW_SortColDecrs 	 >       sort by this column decreasingly.(if already decreasingly then decrease its priority)
	Shortcut! TW_CycleColFmtL	 H       cycle column format left
	Shortcut! TW_CycleColFmtR 	 L       cycle column format right
	Shortcut! TW_NextHistEntry 	 J       next historical entry
	Shortcut! TW_PrevHistEntry	 K       previous historical entry
	Shortcut! TW_CreateBookM         B       create a bookmark for current combination
	Shortcut! TW_ViewDoc 	        <F1>    view the documents
	Shortcut! TW_ClickHndler	 <CR>    click handler
	Shortcut! TW_NextColumn 	 <TAB>   jump to the next column
	Shortcut! TW_PrevColumn 	 <S-TAB> jump to the previous column
	Shortcut! TW_NxtNonEmptyCol	 <right> jump to the next non-empty column
	Shortcut! TW_PrevNonEmptcol	 <left>  jump to the previous non-empty column
	Shortcut! TW_DoneVisSelTsk	 d       set done to all visual selected tasks
	Shortcut! TW_DelAlVisSelTsk	 D       delete all visual selected tasksgg
	Shortcut! TW_VisSelTskInfo	 <CR>    show information about visual selected tasks
	Shortcut! TW_VSelTskToList	 s       add visual selected tasks to selected list
	" Open pdf with zathura
	nnoremap <Leader>pd :!zathura <cfile> &<CR><CR>
	" Make vimb the default browser
	  let g:netrw_browsex_viewer = "vimb<CR>"
	 " Makes all commands available in quickfix window
	 nnoremap <Leader>c  :Commands<CR>
	" Vimwiki markdown fixup
	let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]"
	" Transparent editing of gpg encrypted files.
	" GPG encrypt By Wouter Hanegraaff
	augroup encrypted
	  au!

	  " First make sure nothing is written to ~/.viminfo while editing
	  " an encrypted file.
	  "
	  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
	  " We don't want a various options which write unencrypted data to disk
	  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

	  " Switch to binary mode to read the encrypted file
	  autocmd BufReadPre,FileReadPre *.gpg set bin
	  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
	  " (If you use tcsh, you may need to alter this line.)
	  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

	  " Switch to normal mode for editing
	  autocmd BufReadPost,FileReadPost *.gpg set nobin
	  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
	  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

	  " Convert all text to encrypted text before writing
	  " (If you use tcsh, you may need to alter this line.)
	  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
	  " Undo the encryption so we are back in the normal text, directly
	  " after the file has been written.
	  autocmd BufWritePost,FileWritePost *.gpg u
	augroup END
	" Save file with .gpg extensionton
	nnoremap <Leader>en :saveas <C-R>%.gpg<CR>
	" Build notes in PDF and Html for better viewing
	augroup Notes
	       autocmd!
	       autocmd BufWritePost ~/Notes/*.md silent !buildnotepdf %:p
	       autocmd BufWritePost ~/Notes/*.md silent !buildnotehtml %:p
	augroup END
	nnoremap <Leader>pn  :!pdfnote &<CR><CR>
	nnoremap <Leader>hn  :!htmlnote &<CR><CR>
	" Go To Jump Place
	 function! GotoJump()
	  jumps
	  let j = input("Please select your jump: ")
	  if j != ''
	    let pattern = '\v\c^\+'
	    if j =~ pattern
	      let j = substitute(j, pattern, '', 'g')
	      execute "normal " . j . "\<c-i>"
	    else
	      execute "normal " . j . "\<c-o>"
	    endif
	  endif
	endfunction

	nnoremap <Leader>jm :call GotoJump()<CR>
	" Check diff before write by ;ch
	nnoremap <silent><Leader>ch :w !diff % -<CR>
	" Language Tool cli
	let g:languagetool_jar="$HOME/LanguageTool-5.7/languagetool-commandline.jar"
	nnoremap <silent><Leader>lt :LanguageToolCheck<CR>

	" Define the highlight line color
	highlight LineHighlight ctermbg=darkgray guibg=darkgray
	" highlight the current line
	nnoremap <silent> <Leader>lh :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
	" clear all the highlighted lines
	nnoremap <silent> <Leader>hc :call clearmatches()<CR>
	" Change the cursor color and shape depending on the mode.
	if &term =~ "st_solarized" && $SSH_CLIENT == ''
	    let &t_SI = "\<Esc>]12;purple\x7" . "\<Esc>[5 q"
	    try
		let &t_SR = "\<Esc>]12;darkred\x7" . "\<Esc>[3 q"
	    catch
	    endtry
	    let &t_EI = "\<Esc>]12;royalblue2\x7" . "\<Esc>[2 q"
	endif
	" Command T ruby initialization
	let g:CommandTPreferredImplementation='ruby'
"tips
function! Vtip()
  echomsg system('curl -s ' . "https://vtip.43z.one")
endfunction

noremap <silent><Leader>tp :call Vtip()<CR>
" Man pages with fzf
" stolen from here https://www.reddit.com/r/vim/comments/mg8ov7/fuzzily_searching_man_pages_using_fzfvim/
command! -nargs=? Man call fzf#run(fzf#wrap({'source': 'man -k -s 1 '.shellescape(<q-args>).' | cut -d " " -f 1', 'sink': 'tab Man', 'options': ['--preview', 'MANPAGER=bat MANWIDTH='.(&columns/2-4).' man {}']}))

nnoremap <Leader>m :Man<CR>
" Clear register
command! ClrReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
 autocmd VimEnter * ClrReg
" Ale fixer
" Ale ,language server protocol
" Plugin 'dense-analysis/ale'
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['eslint'],
" \}

" " Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" " Let the completion
" let g:ale_completion_enabled = 1

" " Omni function completion by C-x C-o
" set omnifunc=ale#completion#OmniFunc

" " Auto import from external modules
" let g:ale_completion_autoimport = 1
" Help command at the bottom
" function! ShowBasicCommands()
"     belowright split
"     resize 5

"      enew

"     setlocal buftype=nofile
"     setlocal bufhidden=wipe
"     setlocal noswapfile

"     setlocal modifiable

"     call append(0, [
"                 \ "VIM COMMANDS",
"                 \ "===================",
"                 \ ":w  - Save file   :q   - Quit Vim   i - Insert mode   v  - Visual mode    dd - Delete line",
"                 \ "yy - Yank (copy) line   p - Paste line   /text  - Search for text   :help  - Show help",
"                 \ ";sv  - Reload vimrc  ;sr - open vimrc  ;ot - open terminal"
"                 \ ])

" 	 wincmd w


" endfunction

" call ShowBasicCommands()

" command! HelpCommands call ShowBasicCommands()
" Show matched and replace in a buffer
 nnoremap <Leader>re :g/MATCH/#\|s/MATCH/REPLACE/g\|#
 " Add editor config
 " packadd! editorconfig