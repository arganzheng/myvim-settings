""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: [arganzheng](http://blog.arganzheng.me)
" Updated: 2016-06-08
" Sections:
"       -> Initial Plugin (Plugin Config @see vimrc.plugins)
"       -> General Settings
"       -> Display Settings 
"       -> FileEncode Settings 
"       -> Others
"       -> HotKey Settings 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initial Plugin
" Plugin Config see vimrc.plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the value used for <leader> in mappings
let mapleader = ','
let g:mapleader = ','

syntax on

" install bundles
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileEncode Settings
" @see http://edyfox.codecarver.org/html/vim_fileencodings_detection.html
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,utf-16,big5,cp936,gb2312,iso-8859-1
"set fileencoding=gbk
"set termencoding=gbk

" Use Unix as the standard file type
set ffs=unix,dos,mac

set formatoptions+=m
set formatoptions+=B


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show cursor location
set ruler
" show line number
set number             
" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd
" Show mode I'm in
set showmode

" Keep some 5 more lines for scope
set scrolloff=5 

" When a bracket is inserted, briefly jump to a matching one
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" Make the command line two lines high and change the statusline display to something that looks useful.
set cmdheight=2   
" Always show the status line - use 2 lines for the status bar      
set laststatus=2

set nowrap
"set wrap
"set textwidth=79
"set linebreak
"set showbreak=↪
"set formatoptions=qrn1

" This makes Vim show invisible characters with the same characters that TextMate uses. 
" You might need to adjust your color scheme so they’re not too distracting. 
" This Vimcast has more information.
"set list
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

      
" ensures we can have full spectrum of colors
set t_Co=256
set background=dark

syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim defaults (much better!)
set nocompatible        

" Set the value used for <leader> in mappings
let g:mapleader = ","

" The escape key is a long ways away. This maps it to the sequence 'jj'
:map! jj <esc>

" Similarly, : takes two keystrokes, ; takes one; map the latter to the former
" in normal mode to get to the commandline faster
nnoremap ; :


"" filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" automatically read files when they've changed
set autoread

"" backup
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

set nobackup
" It's 2012, Vim.
set noswapfile

" TODO: remove this, use gundo
" create undo file
" if has('persistent_undo')
  " " How many undos
  " set undolevels=1000
  " " number of lines to save for undo
  " set undoreload=10000
  " " So is persistent undo ...
  " "set undofile
  " set noundofile
  " " set undodir=/tmp/vimundo/
" endif

" Use menu to show command-line completion (in 'full' case)
set wildmenu
" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git,*.swp,*.bak,*.class,.svn

" highlight current line
set cursorline
" change the current line highlighting use a different background color instead of underlining
hi CursorLine term=bold cterm=bold guibg=Grey40

" After quitting vim show the original text in vim
set t_ti= t_te=

" Allow better terminal/mouse integration
set mousemodel=extend

" For regular expressions turn magic on
set magic

" Fix backspace indentation, allow backspacing over all in insert mode
set backspace=indent,eol,start 
set whichwrap+=<,>,h,l


""" Tab Settings

" I like tabstops of 4, and prefer spaces to tabs.
set expandtab       
set tabstop=4
set softtabstop=4

" Use 4 spaces for (auto)indent
set shiftwidth=4
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Added 2005-03-23 Based on http://www.perlmonks.org/index.pl?node_id=441738
set smarttab  " Tab in front of line uses shiftwidth - good for coding

""" Indent Settings
" Smart indent
set smartindent
" Go with smartindent if there is no plugin indent file.
set autoindent

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

""" Better Search
" highlight results of a search
set hlsearch
" clear out the search highlight result
nnoremap <leader><space> :noh<cr>
" incremental searches 
set incsearch
" Make case-insensitive search the norm
set ignorecase
set smartcase

" Turn on modelines @see http://www.tuicool.com/articles/iumIza
set modeline            " Scan for modeline commands
set modelines=4         " Scan 4 lines for modelines


" "Hidden" buffers -- i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
set hidden

" assume a fast terminal connection
set ttyfast             
      
" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full


" Code Folding, everything folded by default
set foldenable
set foldmethod=indent
set foldlevel=99

set winminheight=0      " Allow windows to get fully squashed
set winminwidth=0       " Allow windows to get fully squashed


" generate tags file for your system libraries, and ask your vim to load them
set tags+=/usr/local/include/tags
set tags+=/usr/include/tags
" Search for the tags file upward.  Cool! see :help file-searching
set tags+=tags;/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Others
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" gdefault applies substitutions globally on lines. 
" For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/. 
set gdefault


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HotKey Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable the arrow keys while you’re in normal mode
" It also disables the arrow keys in insert mode 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" makes j and k work the way you expect instead of working in some archaic movement 
" by file line instead of screen line" fashion.
nnoremap j gj
nnoremap k gk


" make the tab key match bracket pairs. 
" I use this to move around all the time and <tab> is a hell of a lot easier to type than %.
nnoremap <tab> %
vnoremap <tab> %

" save changes
map <Leader>s :w<CR>
" exit vim without saving any changes
map <Leader>q :q!<CR>
" exit vim saving changes
map <Leader>w :x<CR>

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Toggle line numbers
nmap <silent> <F4> :set number!<CR>

" Toggle paste
set pastetoggle=<F6>

" page down with <Space>
nmap <space> <pagedown>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_
vnoremap L g_

" I found it useful to have movement in the insert mode, like Emacs.
" Keybindings for movement in insert mode, I use the emace line mode.
imap <C-a> <Esc>I
imap <C-e> <Esc>A

" Emacs bindings in command line mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" visual shifting (does not exit Visual mode)
" vnoremap < <gv
" vnoremap > >gv 

""" Windows Mappings

" open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l 
" open a new horizontal split but not switch over to it. 
nnoremap <leader>W <C-w>s

" use <ctrl> plus direction key to move around within windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <leader>v <C-w>v

"" Window Resizing
" right/up : bigger
" left/down : smaller
nnoremap <m-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>
nnoremap <m-down> :resize -3<cr>

" Copy to system clipboard
vnoremap <leader>y "+y

" Generic highlight changes
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

"
" Per http://vim.sourceforge.net/tips/tip.php?tip_id=330
" this will stop the annoying html indentation.
" xmledit does some things for us, and combined with autoindent that's
" probably enough.
"
autocmd BufEnter *.erb,*.haml,*.htm,*.html,*.kid,*.php,*.rhtml,*.xml,*.xsd setlocal indentexpr= autoindent shiftwidth=2

