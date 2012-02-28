" Author: "arganzheng":http://blog.arganzheng.me
" Weibo: arganzheng
" Date: 2012-02-26
" Many thanks to:
" 1. "zmievski":http://zmievski.org/2007/02/vim-for-php-programmers-slides-and-resources
" 2. "Coming Home to Vim":http://stevelosh.com/blog/2010/09/coming-home-to-vim
" 3. "Kevin McCarthy":http://www.8t8.us/
" 4. "mwop":http://ggmwop.net/blog/249-Vim-Toolbox,-2010-Edition
" 5. "Mir Nazim":http://mirnazim.org/writings/vim-plugins-i-use/
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

syntax on
" set background=dark

" Set the value used for <leader> in mappings
let g:mapleader = ","

" The escape key is a long ways away. This maps it to the sequence 'jj'
:map! jj <esc>

" Similarly, : takes two keystrokes, ; takes one; map the latter to the former
" in normal mode to get to the commandline faster
nnoremap ; :


" This will disable the arrow keys while you’re in normal mode to help you learn to 
" use hjkl. Trust me, you want to learn to use hjkl. Playing a lot of Nethack also helps.

" It also disables the arrow keys in insert mode to force you to get back into normal
" mode the instant you’re done inserting text, which is the “right way” to do things.

" It also makes j and k work the way you expect instead of working in some archaic 
" "movement by file line instead of screen line" fashion.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

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

" Fix backspace indentation, allow backspacing over all in insert mode
set backspace=indent,eol,start 


" }}}
" Backups {{{
set directory=~/.vim/tmp/swap//   " swap files
" set backupdir=~/.vim/tmp/backup// " backups
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

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

" I want the text width to be 79, and for it to wrap. 
" These lines manage my line wrapping settings and also show a colored column at
" 85 characters (so I can see when I write a too-long line of code).
set wrap
set textwidth=79
set linebreak
set showbreak=↪
set formatoptions=qrn1

if exists('+colorcolumn')
    set colorcolumn=85
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>85v.\+', -1)
endif

" This makes Vim show invisible characters with the same characters that
" TextMate uses. You might need to adjust your color scheme so they’re not too
" distracting. This Vimcast has more information.
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮


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

" Turn on "very magic" regex status by default for searches.
" :he /magic for more information
" fix Vim’s horribly broken default regex “handling” by
" automatically inserting a \v before any string you search for. This turns off
" Vim’s crazy default regex characters and makes searches use normal regexes. I
" already know Perl/Python compatible regex formatting, why would I want to
" learn another scheme?
nnoremap / /\v
vnoremap / /\v

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
map <Leader>s :w<CR>
" exit vim without saving any changes
map <Leader>q :q!<CR>
" exit vim saving changes
map <Leader>w :x<CR>

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" Split window management
" open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l 
" open a new horizontal split but not switch over to it. 
nnoremap <leader>W <C-w>s

" use <ctrl> plus direction key to move around within windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

" page down with <Space>
nmap <space> <pagedown>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" I found it useful to have movement in the insert mode, like Emacs.
" Keybindings for movement in insert mode, I use the emace line mode.
imap <C-a> <Esc>I
imap <C-e> <Esc>A

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
"
"""
call pathogen#infect()

"""
" Yankring
"
"""
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"""
" matchit
"
"""
map <tab> %
