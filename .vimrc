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
"syntax enable
let g:CommandTMaxFiles=200000
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
Plugin  'VundleVim/Vundle.vim'
Plugin  'vim-airline/vim-airline'
Plugin  'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dstein64/vim-startuptime'
Plugin  'vifm/vifm.vim'
Plugin  'jamessan/vim-gnupg'
Plugin 'AutoComplPop'
Plugin 'majutsushi/tagbar'
Plugin 'vim-latex/vim-latex'
Plugin 'ying17zi/vim-live-latex-preview'
Plugin 'itchyny/calendar.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'sunaku/vim-shortcut'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-unimpaired'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-titlecase'
Plugin 'svermeulen/vim-macrobatics'
Plugin 'mhinz/vim-startify'
Plugin 'strboul/urlview.vim'
Plugin 'mtth/scratch.vim'
Plugin  'tyru/open-browser.vim'
Plugin 'wincent/command-t'
Plugin 'preservim/nerdtree'
Plugin  'Xuyuanp/nerdtree-git-plugin'
Plugin  'bash-support.vim'
Plugin  'sudo.vim'
Plugin  'erietz/vim-terminator'
Plugin 'mboughaba/i3config.vim'
Plugin 'jreybert/vimagit'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'axvr/org.vim'
Plugin 'voldikss/vim-floaterm'

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
set spell spelllang=en
" Write file with sudo permission with capital W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"vim startup time measure
let g:startuptime_sort = 0
let g:startuptime_tries = 5
let g:startuptime_exe_args = ['-u', '~/.vimrc']
"vifm
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
"NerdTree open CTRL+n
 noremap <C-n> :NERDTreeToggle<CR>
 "Search replaces n number of times
nnoremap Q :normal n.<CR>
"Open URI under cursor by pressing ob and os
 nmap ob :exe 'silent !vimb %'<CR>
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
autocmd FileType lisp setlocal commentstring=\;;\ %s
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
augroup END
"Move between splits
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
"Open this file in vertical split for quick reference
nnoremap <leader>vr :vsplit ~/.vimrc<cr>
"After editing this file must be sourced ,so the changes take effect on
"current session
nnoremap <leader>sv :source ~/.vimrc<cr>
"To insert email address with a shortcut @@ ,to insert author with a shortcut au, to insert date type dts and then need to press space after that
iabbrev @@    unixbhaskar@gmail.com
iabbrev au    Bhaskar Chowdhury
iabbrev <expr> dts strftime("%c")
iabbrev ws  https://github.com/unixbhaskar
" Auto loading .vimrc once saved
if has('autocmd')
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost ~/.vimrc nested source %
    augroup END
endif
" Auto loading .bashrc once saved
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

Shortcut! :Files bring up the fuzzy finder
 map <C-f> <Esc><Esc>:Files!<CR>
 Shortcut! :Blines  in file and go to chosen line
inoremap <C-f> <Esc><Esc>:Blines!<CR>

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
"Visual mode selection move up and down my unimpaired

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

Shortcut!  BackupCurrentFile   BB in normal mode

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

Shortcut! ReplaceBacktickTO$()   Run this varbetim on ex prompt %s/`\([^`]*\)`/$(\1)/g

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
autocmd BufWritePost  *  !echo "$USER modified the file '%:p' at '$(date)'" >> /tmp/vimlog
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
 iab hb #!/bin/bash
 "[ Show help files in a new tab, plus add a shortcut for helpg ]

let g:help_in_tabs = 1

nmap <silent> H  :let g:help_in_tabs = !g:help_in_tabs<CR>

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
nnoremap <leader>b :buffers<cr>
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
nmap <Leader>m : call PreviewerMarkdown()<CR>clear<CR>glow -p $(cat ~/.lastpreview.log)<CR>
" Ale ,language server protocol
Plugin 'dense-analysis/ale'
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
" Search delimiters made easy ,press ;;
noremap ;; :%s:::g<Left><Left><Left>
"noremap ;' :%s:::cg<Left><Left><Left><Left>"
"cmap \\ \(\)<Left>

"Markdown file creation <S-m>
map <S-m> :e .md<Left><Left><Left>
" File type detection for ssh known_host file
au BufNewFile,BufRead known_hosts setfiletype sshknownhost
" Capture register value with AR <C-r>=
imap AR <C-R>=&<S-Right>
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
let hr = (strftime('%H'))
if hr >= 17
         colorscheme molokai_dark
elseif hr >= 6
	colorscheme solarized
elseif hr >= 0
         colorscheme molokai_dark
endif
" Template for source the code block skeleton
function! LispBlock()
	r~/.vim/templates/lispblock
endfunction
nmap <Leader>l :call LispBlock()<CR>

function! MarkDownBlock()
	r~/.vim/templates/markdownblock
endfunction
nmap <Leader>k :call MarkDownBlock()<CR>
" Enlist match and replace in a buffer
" map <S-r> :g//#|s///g|#
" Vimgrep invocation by pressing ;g
 nnoremap <Leader>g :vimgrep  %<Left><Left>
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
 " Vertical split ;v and normal split ;s
 nnoremap <Leader>v :vsplit<CR>
 nnoremap <Leader>s :split<CR>