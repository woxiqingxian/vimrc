
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
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

" Plugin 'https://github.com/flazz/vim-colorschemes.git'  " 配色整合
Plugin 'https://github.com/preservim/nerdtree.git'  " 树形目录结构
Plugin 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plugin 'https://github.com/vim-airline/vim-airline.git'  " 下面的状态栏
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git' " 查询文件
Plugin 'https://github.com/vim-syntastic/syntastic.git'  " 代码语法检查
" Plugin 'https://github.com/dense-analysis/ale.git'  " 代码语法检查(异步)
" Plugin 'https://github.com/majutsushi/tagbar.git'  " 函数结构
Plugin 'https://github.com/python-mode/python-mode.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" Plugin 'https://github.com/pangloss/vim-javascript.git'  " JavaScript高亮
" Plugin 'https://github.com/ternjs/tern_for_vim.git'  " 配合YCM实现JavaScript补全，这是重点
Plugin 'https://github.com/posva/vim-vue.git'  " vue高亮
Plugin 'https://github.com/tmhedberg/SimpylFold.git'  " 用于配合foldmethod=indent 对python 的代码折叠优化
" Plugin 'https://github.com/chr4/nginx.vim.git'  "nginx conf配置文件高亮
Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'  "多色彩括号匹配插件
Plugin 'https://github.com/Yggdroot/indentLine.git'  " 缩进指示
" Plugin 'https://github.com/terryma/vim-smooth-scroll.git'  " 翻页更加顺滑
" Plugin 'https://github.com/mileszs/ack.vim.git' " 配合ag使用搜索文件内容
" Plugin 'https://github.com/xolox/vim-lua-ftplugin'  " lua插件
" Plugin 'https://github.com/xolox/vim-misc'  " lua插件 依赖
Plugin 'https://github.com/fatih/vim-go'  " go插件


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
" set nowrapscan "禁止在搜索到文件两端时重新搜索
nmap <Esc><Esc> :nohlsearch<CR>  " ESC取消搜索高亮

" ------格式
" manual 手工定义折叠
" indent 更多的缩进表示更高级别的折叠
" expr 用表达式来定义折叠
" syntax 用语法高亮来定义折叠
" diff 对没有更改的文本进行折叠
" marker 对文中的标志折叠
set foldmethod=indent
set nowrap        " 取消自动折行
set number        " 显示行号
set autoindent    " 继承前一行的缩进方式，特别适合于多行注释
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

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on
" 处理卡顿
set re=1
set ttyfast
set lazyredraw

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 单行长度超80个字符提醒
" set textwidth=80  " 内容宽度
:set cc=80
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" 设置高亮当前行和当前列
set cursorline " 选中行高亮
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
" set cursorcolumn 选中列高亮
" hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 设置u的返回步数限制
if has('persistent_undo')
    set undofile               " 开启u回滚文件记录
    set undolevels=100         " 最大数量的改变回滚
    set undoreload=1000        " 最大数量重载可回滚行数
endif

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 其他设置
syntax enable
syntax on " 设置语法高亮
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set laststatus=2  " 总是显示状态栏
set shortmess=atI"  " 关闭欢迎页面
" set autowrite     " 切换文件自动保存 https://github.com/terryma/vim-multiple-cursors/raw/master/assets/example1.gif?raw=true
" set wildmenu      " 自动补全时的文件菜单
" set wildmode=list:longest,full " 自动补全时，匹配最长子串，列出文件
" set whichwrap=b,s,h,l,<,>,[,]  " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set scrolljump=10  " 光标离开屏幕范围
set scrolloff=5   " 光标移动至少保留行数
set autoread   "文件在Vim之外修改过，自动重新读入
set helplang=cn  "帮助系统设置为中文
set noswapfile   " 不生成swap文件
set noundofile  " 不生成撤销记录文件
set backspace=2   " 解决插入模式下delete/backspce键失效问题
" set mouse=a   " 支持鼠标滚动


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
" 自定义快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换vim的tab
nmap <C-l> gt
nmap <C-h> gT

" 普通模式下 保存和退出文档
nmap <C-w><C-w> :w<CR>
nmap <C-q><C-q> :q<CR>
nmap <S-q><S-q> :q!<CR>
nmap <C-q><C-a> :qa<CR>
nmap <C-w><C-q> :wq<CR>


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


"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  " 个人签名
"  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  function Signature()
"  	call setline(1,'/*')
"  	call append(line('. '),'*  Author: woxiqingxian@gmail.com')
"  	call append(line('. ')+1,'*  Time: '.strftime('%c'))
"  	call append(line('.')+2,'*  File: '.expand('%'))
"  	call append(line('.')+3,'*  Desc :')
"  	call append(line('.')+4,'*/')
"  endf
"  nmap <F4> <Esc>:0<ESC>:call Signature()<CR><Esc>



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" " 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set norelativenumber number
"   else
"     set relativenumber
"   endif
" endfunc
" nnoremap <C-n> :call NumberToggle()<cr>


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


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " setting of tagbar
" " ubuntu: sudo apt-get install exuberant-ctags 支持
" " mac: brew install ctags
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <F8> :TagbarToggle<CR>


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
let NERDTreeHighlightCursorline=1
set t_Co=256
let NERDTreeShowBookmarks=1
" 那些不显示
let NERDTreeShowHidden=1
let NERDTreeIgnore=[
    \ '\.pyc', '\~$', '\.swo$', '\.swp$', '^\.git$', '\.hg',
    \ '\.svn', '\.bzr', 'node_modules', '__pycache__',
    \ '\.tmp', '\.DS_Store'
    \]
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let g:nerdtree_tabs_open_on_gui_startup=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-nerdtree-tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_focus_on_files=1
map <C-e> :NERDTreeFocusToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|__pycache__$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.jpg$'
	\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic # https://github.com/scrooloose/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\.py$', '\.go$']  " 不校验py避免和python-mode冲突
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 0
" nnoremap <silent> <C-d> :lclose<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_rope = 0
let g:pymode_lint_on_write = 1
let g:pymode_warnings = 0
let g:pymode_lint_checkers = ['pyflakes', 'mccabe'] "  Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.


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


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " setting of vim-smooth-scroll
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Distance: This is the total number of lines you want to scroll
" " Duration: This is how long you want each frame of the scrolling animation to last in milliseconds. Each frame will take at least this amount of time. It could take more if Vim's scrolling itself is slow
" " Speed: This is how many lines to scroll during each frame of the scrolling animation
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " setting of ack.vim
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 使用 leader + a search
" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep --nogroup --column'
" endif
" " 高亮搜索关键词
" let g:ackhighlight = 1

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " setting of vim-javascript
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let javascript_enable_domhtmlcss = 1


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " setting of ale
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
"
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" " let g:ale_set_highlights = 1
"
" " Write this in your vimrc file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" " You can disable this option too
" " if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting of fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_experimental = 1  " 保存格式化的时候不要折叠
let g:godef_split = 2 "左右打开新窗口的时候
let g:godef_same_file_in_same_window = 1 "函数在同一个文件中时不需要打开新窗口
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
