"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置文件编码
set ff=unix
set encoding=utf-8
set fenc=utf8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gb2312,cp936,gbk
set fdm=marker

" ------设置搜索
set hlsearch " 高亮搜索项 
set incsearch " 搜索时自动匹配 
set ignorecase    " 无视大小写 
set smartcase     " 如果有大写就区别大小写匹配
" set nowrapscan " 禁止在搜索到文件两端时重新搜索
nmap <Esc><Esc> :nohlsearch<CR>

" ------格式
set foldmethod=indent  "syntax  代码折叠
set nowrap        " 取消自动折行
set number  " 显示行号
set autoindent  " 继承前一行的缩进方式，特别适合于多行注释
set tabstop=4     " tab=4空格 
set softtabstop=4 " 回退可以删除缩进 
set shiftwidth=4  " 缩进位宽=4个空格位
set autoindent    " 自动缩进 
set expandtab     " tab由空格表示

set nojoinspaces  " 用J合并两行用一个空格隔开
set splitright    " 用vsplit新建窗口，让新的放右边
set splitbelow    " 用split新建窗口，让新的放下面
set iskeyword-=.  " 让'.' 作为单词分割符
set iskeyword-=#  " 让'#' 作为单词分割符
set iskeyword-=-  " 让'-' 作为单词分割符
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " 空格等无效字符显示

" 单行长度超80个字符提醒 
"set textwidth=80  " 内容宽度
:set cc=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" 设置高亮当前行和当前列
set cursorline " 选中行高亮
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 设置u的返回步数限制
if has('persistent_undo')
    set undofile               " 开启u回滚文件记录
    set undolevels=1000         " 最大数量的改变回滚
    set undoreload=10000        " 最大数量重载可回滚行数
endif

" 其他设置
syntax enable
syntax on " 设置语法高亮
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set laststatus=2  " 总是显示状态栏
set shortmess=atI"  " 关闭欢迎页面
" set autowrite     " 切换文件自动保存 https://github.com/terryma/vim-multiple-cursors/raw/master/assets/example1.gif?raw=true
set wildmenu      " 自动补全时的文件菜单
set wildmode=list:longest,full " 自动补全时，匹配最长子串，列出文件
set whichwrap=b,s,h,l,<,>,[,]  " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set scrolljump=10  " 光标离开屏幕范围 
set scrolloff=5   " 光标移动至少保留行数
set autoread   "文件在Vim之外修改过，自动重新读入
set helplang=cn  "帮助系统设置为中文
set noswapfile   " 不生成swap文件
set noundofile  " 不生成撤销记录文件
set backspace=2   " 解决插入模式下delete/backspce键失效问题
set mouse=a   " 支持鼠标滚动


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换vim的tab
nmap <C-l> gt
nmap <C-h> gT
" tab自动换为四个空格
map <F7> mzgg=G`z<CR>`

" 设置tag和window间快速跳转 
" let g:easyWindows = 1
" if exists('g:easyWindows')
"     " 向上
"     map <C-J> <C-W>j<C-W>_  
"     " 向下
"     map <C-K> <C-W>k<C-W>_
"     " 向右
"     map <C-L> <C-W>l<C-W>_
"     " 向左
"     map <C-H> <C-W>h<C-W>_
" endif

" 没sudo却想保存
cmap w!! w !sudo tee % >/dev/null

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
" vim与系统公用剪切板(兼容mac和liunx)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
" colorscheme darkblue2
" colorscheme kalisi
colorscheme solarized
" colorscheme codeschool 
" colorscheme dracula
" colorscheme janah
" colorscheme darkocean


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 个人签名
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Signature()
	call setline(1,"/*")
	call append(line(". "),"*  Author: woxiqingxian@gmail.com")
	call append(line(". ")+1,"*  Time: ".strftime("%c"))
	call append(line(".")+2,"*  File: ".expand("%"))
	call append(line(".")+3,"*  Desc :")
	call append(line(".")+4,"*/")
endf
nmap <F4> <Esc>:0<ESC>:call Signature()<CR><Esc>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of tagbar
" 需要安装 sudo apt-get install exuberant-ctags 支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <F8> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of multi_cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_next_key='<C-x>'
" let g:multi_cursor_prev_key='<C-z>'
" let g:multi_cursor_skip_key='<C-c>'
" let g:multi_cursor_quit_key='<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下三个配置是显示buffer(编辑过的文件)
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" 显示下面的状态栏
set laststatus=2
let g:airline_theme = "dark"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 25
set t_Co=256
let NERDTreeShowBookmarks=1
" 那些不显示
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', 'node_modules', '__pycache__']  
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
" setting of nerdtree-git-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

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
" execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|bookdata$\|__pycache__$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.jpg$'
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
" let g:syntastic_loc_list_height = 5
" let g:syntastic_aggregate_errors = 1
" nnoremap <silent> <C-d> :lclose<CR>

" Pathogen load
" filetype off
" 
" call pathogen#infect()
" call pathogen#helptags()
" 
" filetype plugin indent on
" syntax on
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_rope = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of vim-jsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of SimpylFold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SimpylFold_docstring_preview=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of rainbow_parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setColors = 1
let g:indentLine_char = "┆"
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of vim-smooth-scroll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 5)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_experimental = 1  " 保存格式化的时候不要折叠
let g:godef_split = 2 "左右打开新窗口的时候
let g:godef_same_file_in_same_window = 1 "函数在同一个文件中时不需要打开新窗口


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
" Plugin 'tpope/vim-fugitive'  " 将git集合到vim
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'https://github.com/wincent/command-t.git'
" Plugin '/home/eddie/Downloads/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " html高亮工具
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/bling/vim-airline.git'
" Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
" Plugin 'https://github.com/davidhalter/jedi-vim.git'
Plugin 'https://github.com/flazz/vim-colorschemes.git'  " 配色整合
Plugin 'https://github.com/klen/python-mode.git'
Plugin 'http://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/moll/vim-node.git'
Plugin 'https://github.com/pangloss/vim-javascript.git'
Plugin 'https://github.com/jelera/vim-javascript-syntax.git'  " 增加JavaScript的高亮显示
Plugin 'marijnh/tern_for_vim'  " 配合YCM实现JavaScript补全，这是重点
Plugin 'posva/vim-vue'  " vue高亮
Plugin 'mxw/vim-jsx' " jsx语法高亮
" Plugin 'tomlion/vim-solidity'  " solidity 语言
Plugin 'tmhedberg/SimpylFold'  " 用于配合foldmethod的代码折叠
Plugin 'chr4/nginx.vim'  "nginx conf配置文件高亮
Plugin 'kien/rainbow_parentheses.vim'  "多色彩括号匹配插件
Plugin 'Yggdroot/indentLine'  " 缩进指示
Plugin 'scrooloose/nerdcommenter'  " 快速注释
Plugin 'terryma/vim-smooth-scroll'  " 翻页更加顺滑
Plugin 'fatih/vim-go'  " go工具



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

