"Vim Configuration

"""""""""""""""""""""""""""""
""""""" Set Vundle """"""""""
"""""""""""""""""""""""""""""

if filereadable(expand("~/.vimrc_vundle"))
	source ~/.vimrc_vundle
endif


""""""""""""""""""""""
"basic options
""""""""""""""""""""""
set tabstop=2
set expandtab
set softtabstop=4
set autoindent
set shiftwidth=2
set number
filetype on 
set history=1000 
set mouse=a
syntax on
set list lcs=tab:\|\ "here's a space
set clipboard=unnamed

" Search Option
set hls
set ic
"set is

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
set textwidth=79

"""""""""""""
" color theme"
"""""""""""""
syntax enable
"set background=dark
"colorscheme molokai
"colorscheme base16-default-dark
colorscheme gruvbox

""""""""""
" NERDTree"
""""""""""
let NERDChristmasTree=1
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1

" autocmd vimenter * if !argc() | NERDTree | endif"
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&" :NERDTreeType == "primary") | q | endif"
nmap <F4> :NERDTreeToggle<cr>
" 补全括号和引号
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ` ``<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

""""""""""Powerline""""""""""""
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols='unicode'
set t_Co=256 "solve no color problem

""""""缩进指示线"""""""
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"""""""autopep8设置""""""
let g:autopep8_disable_show_diff=1

