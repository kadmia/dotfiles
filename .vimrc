filetype off "In case system vimrc enables this for me
call pathogen#runtime_append_all_bundles()
filetype plugin indent on "filetype detection, see ~/.vim/after/ftplugin
set backspace=2 "allow backspace to erase previously entered characters
set nocompatible "fuck legacy vi compatibility
syntax on   "turn on syntax highlighting
set number	"line numbers on the side
set scrolloff=5 "leave 5 lines at the top and bottom while moving cursor

set ignorecase "I read that this is needed before smartcase
set smartcase "case sensitive only when capital letters ar present

set incsearch	"search jumps to matches while typing
set hlsearch	"highlight all matching patterns while searching

set autoread	"set to autoread when a file is changed from the outside
set autowrite "write the file on some commands

set hidden "allow buffers to go to the background even if they are unsaved

set undofile "saves undo tree to a file and loads later

"Indentation setting
set expandtab	"insert softtabstop amount of space chars
set tabstop=2	"width of tab char, by default softtabstop is set to this
set shiftwidth=2 "affects how automatic indentation works
set autoindent	"copy the indentation from the previous line. No interference with othe indentation settings
set smartindent "C-like indentation

"ctags stuff
set tags=tags;
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"vim-latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_MultipleCompileFormats = 'pdf'


"status bar with all sorts of goodies
set statusline:%F%m%r%h%w\|type:%Y\|pos:%04l,%04v\|%p%%\|lines:%L
set laststatus=2

"bash like tab completion
set wildmode=longest,list,full
set wildmenu

"Hide stuff from NERDTree
let NERDTreeIgnore = ['\.pyc$']

"---------Key Mappings (not tied to other settings e.g. ctags)---------
let mapleader = ","
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"remove whitespace at the end of all the lines
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"f5 = list buffers and set up for pressing a number to switch to it
nnoremap <F5> :buffers<CR>:buffer<Space>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
