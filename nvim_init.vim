
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'  " 状态栏

" nerdtree 是主要的， vim-nerdtree-tabs配合在所有buffer展开文件树
Plug 'preservim/nerdtree'  " 树形文件
Plug 'jistr/vim-nerdtree-tabs'  " 树形文件

Plug 'kien/rainbow_parentheses.vim'  "多色彩括号匹配插件
Plug 'Yggdroot/indentLine'  " 缩进指示

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " go插件 
Plug 'posva/vim-vue'  " vue 语法高亮

" " 语法补全服务，deoplete是一个框架，对应语言的补全需要对应的插件
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " 自动补全
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}  " go语法补全插件
" Plug 'deoplete-plugins/deoplete-jedi'  " python语法补全插件

" 语法补全服务，coc是一个框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 语法检查框架  对应语言的语法检查也需要本地支持，
" 查看当前文件语法检查信息 :ALEInfo 命令
Plug 'dense-analysis/ale' 

" 文件搜索 因为fzf设置搜索排除比较麻烦，
" 所以文件搜素用ctrlp
" 文件内容搜索使用fzf配置的ag
Plug 'ctrlpvim/ctrlp.vim'  " 文件搜索
" 文件搜索工具 本地需要安装fzf，使用brew安装 这样下面的路径才对得上
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'  

call plug#end()

  
filetype plugin indent on  "开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
syntax on         "语法高亮
set encoding=utf-8  "通用的 utf8 编码，避免乱码
set hidden
set number        " 显示行号
set ignorecase    " 无视大小写
set smartcase     " 如果有大写就区别大小写匹配
set foldmethod=indent  " 定义折叠代码 
set tabstop=4     " tab=4空格
set expandtab     " tab由空格表示
set shiftwidth=4  " 缩进位宽=4个空格位
set nowrap        " 取消自动折行
set scrolljump=10 " 光标离开屏幕范围 
set scrolloff=5   " 光标移动至少保留行数
set splitright    " 用vsplit新建窗口，让新的放右边
set splitbelow    " 用split新建窗口，让新的放下面

vnoremap < <gv    " 调整缩进后自动选中，方便再次操作
vnoremap > >gv    " 调整缩进后自动选中，方便再次操作
nmap <Esc><Esc> :nohlsearch<CR>  " ESC取消搜索高亮
nmap <C-a> ggvG$  " 全选
nmap <C-l> gt     " 切换vim的tab
nmap <C-h> gT     " 切换vim的tab


" 设置高亮当前行和当前列
set cursorline " 选中行高亮
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
" set cursorcolumn 选中列高亮
" hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized

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
" preservim/nerdtree
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
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jistr/vim-nerdtree-tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_focus_on_files=1
map <C-e> :NERDTreeFocusToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" kien/rainbow_parentheses
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
" Yggdroot/indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setColors = 1
let g:indentLine_char = "┆"
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Shougo/deoplete.nvim
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#enable_at_startup = 1
" " 函数方法 Preview 的窗口自动关闭
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " 自动补全提示默认 ctrl-n 下翻页，改成 tab
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " 自动补全提示默认 ctrl-p 下翻页，改成 s-tab
" inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
" 
" 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " deoplete-plugins/deoplete-go
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ctrlpvim/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <C-p> :CtrlP<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.svn$\|node_modules$\|__pycache__$',
    \ 'file': '\.pyc$\|\.jpg$'
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' 
\}
let g:fzf_layout = { 'down': '40%' }
" nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <S-p> :Ag<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dense-analysis/ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = '▒▒'  " 自定义错误标志
let g:ale_sign_warning = '░░'  " 自定义警告标志
" go     本地需要对应的包，但是本机安装go之后，一般都有了
" python 本地需要安装  pip3 install --upgrade pyflakes
" vue    本地需要安装 npm install -g vls
let g:ale_linters = {
\   'go': ['gofmt', 'golint', 'gopls', 'govet'],  
\   'python': ['pyflakes'],  
\   'vue': ['vls', 'eslint'],  
\   'javascript': ['eslint', 'tsserver'],  
\}
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" 使用airline显示信息
let g:airline#extensions#ale#enabled = 1
" 显示错误列表
let g:ale_open_list = 1
" 显示错误列表的行数
let g:ale_list_window_size = 5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc需要支持插件
let g:coc_global_extensions = [
    \ 'coc-vimlsp',
    \ 'coc-jedi',
    \ 'coc-go',
    \ 'coc-vetur',
    \ 'coc-tsserver',
    \ 'coc-sh',
    \ ]
" 响应时间
set updatetime=100
" 使用tab选中提醒列表
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 回车确认补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
