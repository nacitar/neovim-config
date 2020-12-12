" be improved; not legacy vi
set nocompatible

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'nacitar/a.vim'
call plug#end()

" Support Japanese Shift-JIS encoding
set fileencodings=ucs-bom,utf-8,sjis,default,latin1

if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    " Detect c++ files, including google-style extensions
    autocmd BufRead,BufNewFile *.cc,*.cpp,*.h,*.hpp set filetype=cpp
    " Assume Cpp11-Syntax-Support is installed, and change cpp to cpp11
    " au FileType cpp set filetype=cpp11
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4 (still a \t)
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces. 

if has('gui_running')
	set guifont=Monospace\ 10
else
	" Enable 256 colors
	if $TERM =~ '256color'
		set t_Co=256
	endif
endif

" Automatically indent things
set autoindent
set smartindent
" Enable modelines
set modeline

" Use syntax highlighting to control folding
set foldmethod=syntax
" No fold columns
set foldcolumn=0
" Start with all folds open
set foldlevelstart=99


" Always show the statusline
set laststatus=2
set statusline=%<\ %F%(\ %m%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]\ 
" Choose our color scheme
colors simple-balanced

if (has("termguicolors"))
    set termguicolors
endif
syntax enable
" syntax highlighting can be slow for really long lines; this fixes it.
set synmaxcol=300

" Support mouse input
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

" use system clipboard for everything
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" No backup files
set nobackup
set nowritebackup
" We do want swap files; no duplicate editing!
"set noswapfile

" Persistent undo
if !has('nvim')
    set undodir=~/.vim/undodir  " neovim does the right thing already
endif
set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

" Highlight matched search results; you can turn off active highlighting with :noh
set hlsearch
" Highlight upcoming matches while typing in search criteria
set incsearch
" Searches are case-insensitive if they contain all lowercase
set ignorecase
set smartcase
" When searching, scroll to the next search pattern automatically with 7+ lines visible above and below the cursor
set scrolloff=7

" Set a nicer foldtext function that matches indentation level
set foldtext=MyFoldText()
function! MyFoldText()
    let lines = 1 + v:foldend - v:foldstart
    let ind = indent(v:foldstart)

    let spaces = ''
    let i = 0
    while i < ind
        let spaces .= ' '
        let i += 1
    endwhile

    let linestxt = 'lines'
    if lines == 1
        linestxt = 'line'
    endif

    let firstline = getline(v:foldstart)
    let line = firstline[ind : ind+80]

    return spaces . '+' . v:folddashes . ' ' . lines . ' ' . linestxt . ': ' . line . ' '
endfunction
