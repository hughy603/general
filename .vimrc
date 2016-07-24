" This vimrc is build for Python and based off
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

" This is based off using Vundle as a plugin Manager.
" Download it through
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" touch ~/.vimrc

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Fold blocks of text by hitting the space key
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

set tabstop=4
set softtabstop=4
set shiftwidth=4
" PEP8 Code Styling
au BufNewFile,BufRead *.py
    \ set tabstop=4		|
    \ set softtabstop=4		|
    \ set shiftwidth=4		|
    \ set textwidth=79		|
    \ set expandtab		|
    \ set autoindent		|
    \ set fileformat=unix

" Full stack development Styling
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=1		|
    \ set softtabstop=1		|
    \ set shiftwidth=1		|
    \ set expandtab

" AWS Yaml config files
au BufNewFile,BufRead *.config
    \ set tabstop=4		|
    \ set softtabstop=4		|
    \ set shiftwidth=4		|
    \ set textwidth=79		|
    \ set expandtab		|
    \ set autoindent		|
    \ set fileformat=unix

" PEP8 Auto indentation 
Plugin 'vim-scripts/indentpython.vim'

" Flag unnecessary whitespace
"
" The highlight line was not in the tutorial. It is needed for the au line to
" work
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 Supports
set encoding=utf-8

" Auto Complete
" Installation instructions below
" sudo apt-get install build-essential cmake
" Bundle 'Valloric/YouCompleteMe'
" The former line ensures that the autocomplete window goes away when you’re
" done with it, and the latter defines a shortcut for goto definition.
"
" My leader key is mapped to space, so space-g will goto definition of
" whatever I’m currently on. Helpful when exploring new code.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Toggle if gui mode is enabled
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" Switch between solarized light and dark mode
call togglebg#map("<F5>")

" File Browsing
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Searching: Ctrl-P will enable the search
Plugin 'kien/ctrlp.vim'

" Git integration: Disabled
" Example is at
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
" Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" If on OSX set the clipboard: Disabled
" set clipboard=unnamed



let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
