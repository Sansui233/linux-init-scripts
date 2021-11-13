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
set tabstop=4
set shiftwidth=4
set smartindent
set number
filetype on 
set history=1000 
set mouse=a
syntax on
set guifont=Meslo\ LG\ M\ for\ Powerline:h14
set list lcs=tab:\|\ "here's a space
set clipboard=unnamed

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
colorscheme molokai

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

""""""""""You Complete Me"""""""""""
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=1
" 字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
""""""""""You Complete Me"""""""""""


"""""""""""Comment"""""""""""
let g:NERDSpaceDelims = 1

