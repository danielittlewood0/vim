" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Use Vim settings, rather than Vi settings.
set nocompatible
" Vundle setup
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'skywind3000/vim-keysound'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'bkad/CamelCaseMotion'
Plugin 'mattn/emmet-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set undodir=/tmp
set backupdir=/tmp
set directory=/tmp
set backup         " backup files file~
set undofile       " keep an undo file (undo changes after closing)
set history=50     " keep 50 lines of command line history
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
" set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching
set autowrite      " Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned
set mouse=a        " Enable mouse usage (all modes)
set relativenumber " Relative line numbers
set hlsearch       " Highlight search results
set cursorline     " Highlight the line with the cursor
set ruler          " Show absolute row and column on the status line
set nowrap         " Do not wrap lines
syntax on

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

set autoindent " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" Leave insert mode quickly
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>

" Wrap visual selection in brackets
vnoremap ( c()<ESC>P
vnoremap { c{}<ESC>P
vnoremap [ c[]<ESC>P

filetype plugin indent on " Indenting
set tabstop=2             " Show existing tab with 2 spaces width
set shiftwidth=2          " When indenting with '>', use 2 spaces width
set expandtab             " On pressing tab, insert 2 spaces

" Soft border at 80 chars
set colorcolumn=80
hi ColorColumn ctermbg=black

" camel case motions
let g:camelcasemotion_key = '<Tab>'

" window motion with ctrl
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

command! Cpfp :let @+ = expand('%:p:h')

" conceal by default
set cole=2
hi conceal cterm=bold
" hi conceal ctermbg=bg

" fat fingers
command! W :w
command! Wq :wq

" Sublime comments
nnoremap <C-\> gcc
vnoremap <C-\> gc

" Makes vim sound like a typewriter (gimmick)
" let g:keysound_enable = 1
" let g:keysound_theme = 'typewriter'
" set visualbell
" set t_vb=

colorscheme jellybeans
