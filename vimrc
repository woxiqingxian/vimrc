"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置文件编码
set ff=unix
set encoding=utf-8
set fenc=utf8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gb2312,cp936,gbk
set fdm=marker

" 设置语法高亮
syntax on

" 设置搜索
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR>

" 以下三个配置配合使用，设置tab和缩进空格数
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"文件在Vim之外修改过，自动重新读入
set autoread

"帮助系统设置为中文
set helplang=cn

"代码折叠
set foldmethod=syntax

" 不生成swap文件
setlocal noswapfile

" 显示行号
set number

" 继承前一行的缩进方式，特别适合于多行注释
" set autoindent

" 设置高亮当前行和当前列
set cursorline
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 单行长度超80个字符提醒 
:set cc=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-l> gt
nmap <C-h> gT
" tab自动换为四个空格
map <F7> mzgg=G`z<CR>`


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 模拟windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置模拟windows的复制粘帖全选
" vmap <C-c> "+y
" vmap <C-x> "yd
" nmap <C-v> "+p
" vmap <C-v> "+p
nmap <C-a> ggvG$
" 模仿MS Windows中的保存命令: Ctrl+S
" imap <C-s> <Esc>:wa<cr>i<Right>
" nmap <C-s> :wa<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim与系统公用剪切板
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
set nu
set background=dark
set t_Co=256
let g:solarized_termcolors=256
" colorscheme darkblue2
" colorscheme kalisi
" colorscheme solarized
" colorscheme codeschool 
" colorscheme dracula


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 个人签名
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Signature()
	call setline(1,"/*")
	call append(line(". "),"*  Author: woxiqingxian@qq.com")
	call append(line(". ")+1,"*  Time: ".strftime("%c"))
	call append(line(".")+2,"*  File: ".expand("%"))
	call append(line(".")+3,"*  Desc :")
	call append(line(".")+4,"*/")
endf
nmap <F4> <Esc>:0<ESC>:call Signature()<CR><Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_start_level = 2
let g:indent_guides_start_size = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of tagbar
" 需要安装 sudo apt-get install exuberant-ctags 支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of multi_cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_prev_key='<C-z>'
let g:multi_cursor_skip_key='<C-c>'
let g:multi_cursor_quit_key='<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下三个配置是显示buffer(编辑过的文件)
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" 显示下面的状态栏
set laststatus=2
" let g:airline_theme =  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 25
set t_Co=256
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=0
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
nn <silent><F2> :exec("NERDTree ".expand('%:h'))<CR>
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jedi#auto_initialization = 1
" let g:jedi#use_splits_not_buffers = "bottom"
" let g:jedi#popup_select_first = 0
" let g:jedi#completions_enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$'
	\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic # https://github.com/scrooloose/syntastic
" 需要安装 https://github.com/tpope/vim-pathogen
" 需要安装 sudo pip install flake8 (python的格式检查器)
"		   sudo apt-get install python-flake8
"		   建议不要使用，过于格式化，提醒也不人性化
"		   使用 https://github.com/klen/python-mode.git 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 1
nnoremap <silent> <C-d> :lclose<CR>

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
let $GIT_SSL_NO_VERIFY = 'true'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/wincent/command-t.git'
" Plugin '/home/eddie/Downloads/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/davidhalter/jedi-vim.git'
Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plugin 'https://github.com/flazz/vim-colorschemes.git'
Plugin 'https://github.com/klen/python-mode.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

