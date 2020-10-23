" Neo/vim Settings
" ================
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf-8

" General {{{
set mouse=nv								 " Disable mouse in command-line mode
set modeline								 " automatically setting options from modelines
set report=0								 " Don't report on line changes
set noerrorbells						 " No trigger bell on error
set visualbell
set signcolumn=yes					 " Always show signs column
set hidden									 " hide	buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set path=.,**								 " Directories to search when using gf
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block				 " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
set formatoptions=
set formatoptions+=1				 " Don't break lines after a one-letter word
set formatoptions+=j				 " Remove comment leader when joining lines
set formatoptions+=n         " smart auto-indenting inside numbered lists
set formatoptions-=o				 " Don't continue comment using o or O
set formatoptions-=t				 " Don't auto-wrap text

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

if exists('+emoji')
  set noemoji
endif

" }}}
" Wildmenu {{{
" --------
if has('wildmenu')
	set nowildmenu
	set wildmode=list:longest,full
	set wildoptions=tagfile
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache
endif

" }}}
" Vim Directories {{{
" ---------------
set undofile noswapfile nobackup nowritebackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
set spellfile=$VIM_PATH/spell/en.utf-8.add

" History saving
set scrollback=100000
set history=2000 " Sets how many lines of history VIM has to remember
if has('nvim')
	set shada='300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set nowritebackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

" What to save for views and sessions:
set sessionoptions-=options
set sessionoptions-=folds
set sessionoptions-=blank
set viewoptions=folds,cursor,curdir,slash,unix

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" }}}
" Tabs and Indents {{{
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set shiftwidth=2    " Number of spaces to use in auto(indent)
set softtabstop=-1  " While performing editing operations
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
" set noshiftround    " Round indent to multiple of 'shiftwidth'

if exists('&breakindent')
	set breakindentopt=shift:2,min:20
endif

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500   " Time out on mappings
set updatetime=300   " Idle time to write swap and trigger CursorHold
set ttimeoutlen=10   " Time out on key codes
set redrawtime=1500  " Time in milliseconds for stopping display redraw

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search

set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary
set complete-=i			" included files: prevent a condition where vim lags due to searching include files.
set complete-=t
set complete+=kspell

if exists('+inccommand')
	set inccommand=nosplit
endif

" }}}
" Behavior {{{
" --------
set autoread										" Set to auto read when a file is changed from the outside
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set completeopt=noinsert,menuone,noselect

" Do not insert any text for a match until the user selects from menu

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

" Use the new Neovim :h jumplist-stack
if has('nvim-0.5')
	set jumpoptions=stack
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
endif

" }}}
" Editor UI {{{
" --------------------
set termguicolors       " Enable true color
set nonumber            " Don't show line numbers
set norelativenumber      " Show relative number
set noshowmode          " Don't show mode in cmd window
set noruler             " Disable default status ruler
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set fcs=eob:\           " hide ~ tila
set nolist
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

set showmatch           " Jump to matching bracket
set matchpairs+=<:>     " Add HTML brackets to pair matching
set matchtime=1         " Tenths of a second to show the matching paren

set shortmess+=F
set shortmess+=aFc
set shortmess+=A        " ignore annoying swapfile messages
set shortmess+=I        " no splash screen
set shortmess+=T        " truncate other message
set shortmess+=O        " file-read message overwrites previous
set shortmess+=W        " don't echo '[w]' '[written]' when writing
set shortmess+=a        " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o        " overwrite file-written messages
set shortmess+=t        " truncate file messages at start
set shortmess+=c				" Don't pass messages to


set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set noshowcmd           " Show command in status line
set cmdheight=1         " Height of the command line
set cmdwinheight=5      " Command-line lines
set equalalways         " Resize windows on split or close
set laststatus=2        " Always show a status line
set display=lastline

if has('folding')
	set foldenable
	set foldmethod=indent
	set foldlevelstart=99
endif

if has('conceal') && v:version >= 703
	" For snippet_complete marker
	set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
	set previewpopup=height:10,width:60
endif

" Pseudo-transparency for completion menu and floating windows
if &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

set shellslash
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
