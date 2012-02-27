" Author: "arganzheng":http://blog.arganzheng.me
" Weibo: arganzheng
" Date: 2012-02-26
" Many thanks to:
" 1. "http://zmievski":http://zmievski.org/2007/02/vim-for-php-programmers-slides-and-resources
" 2. "Kevin McCarthy":http://www.8t8.us/
" 3. "mwop":http://ggmwop.net/blog/249-Vim-Toolbox,-2010-Edition
" 4. "Mir Nazim":http://mirnazim.org/writings/vim-plugins-i-use/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setup - behaviour, filetypes, syntax
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source! %

set encoding=utf-8

filetype plugin indent on " Turns on filetype detection, plugin, indent

" Color scheme
" ensures we can have full spectrum of colors
set t_Co=256

syntax enable

" Set the value used for <leader> in mappings
let g:mapleader = ","

" The escape key is a long ways away. This maps it to the sequence 'jj'
:map! jj <esc>

" Similarly, : takes two keystrokes, ; takes one; map the latter to the former
" in normal mode to get to the commandline faster
nnoremap ; :


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " Use Vim defaults (much better!)

"" Tab Settings. I like tabstops of 4, and prefer spaces to tabs.
set expandtab           
set tabstop=4
set softtabstop=4

"" Added 2005-03-23 Based on http://www.perlmonks.org/index.pl?node_id=441738
set smarttab  " Tab in front of line uses shiftwidth - good for coding

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround
" Use 4 spaces for (auto)indent
set shiftwidth=4
 
" Go with smartindent if there is no plugin indent file.
set autoindent  smartindent

set backspace=indent,eol,start " Fix backspace indentation, allow backspacing over all in insert mode

" set noautowrite         " Don't automatically write the file
set nobackup            " Don't create backup files
set noswapfile          " Turn off annoying swapfiles

" Make the command line two lines high and change the statusline display to
" " something that looks useful.
set cmdheight=2         
set laststatus=2 " Always show status bar

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

set showmode            " Show mode I'm in

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd        

set ruler               " Show cursor location
set number
" set background=dark
" set textwidth=0         " don't automatically wrap my text
set textwidth=80 " I want the text width to be 80, and for it to wrap. 

" Scrolling options
set scrolloff=3 " Keep some 3 more lines for scope

" Better Search
" Don't highlight results of a search
set nohlsearch
set incsearch

" When a bracket is inserted, briefly jump to a matching one
set showmatch " Show matching brace

" Make case-insensitive search the norm
set ignorecase
set smartcase


" Turn on modelines
set modeline            " Scan for modeline commands
set modelines=4         " Scan 4 lines for modelines

set tags=tags;/         " Search for the tags file upward.  Cool!
                        " see :help file-searching

set ttyfast             " assume a fast terminal connection

" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu          

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

set winminheight=0      " Allow windows to get fully squashed
set winminwidth=0       " Allow windows to get fully squashed

" "Hidden" buffers -- i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
set hidden

" Code Folding, everything folded by default
set foldmethod=indent
set foldlevel=99
set foldenable

" Allow better terminal/mouse integration
set mousemodel=extend

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My various  maps, settings, and autocmds, and tips:)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" save changes
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" Split window management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s
nnoremap <leader>s :new<CR>

" use <ctrl> plus direction key to move around within windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"
" Switch between windows, maximizing the current window
"
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

" page down with <Space>
nmap <space> <pagedown>

" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" 
"  Pathogen
"  "
"  """
call pathogen#infect()


