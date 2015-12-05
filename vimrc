"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.py 文件，自动插入文件头 
autocmd BufNewFile *.py exec ":call SetPyTitle()" 
""定义函数SetPyTitle，自动插入文件头 
func SetPyTitle() 
    call setline(1,"# -*- coding: utf-8 -*- ") 
    call append(line("."), "# File Name: ".expand("%")) 
    call append(line(".")+1, "# Author: woxiqingxian") 
    call append(line(".")+2, "# Created Time: ".strftime("%c")) 
    call append(line(".")+3, "") 
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-l> gt
nmap <C-h> gT
syntax enable
map <F7> mzgg=G`z<CR>`
nmap <F8> :%s/\t/\ \ \ \ /g<CR>
nmap <Esc><Esc> :nohlsearch<CR>
" colorscheme southernlights

set encoding=utf-8
set fileencodings=utf-8,gbk
set fencs=utf-8,gbk
set langmenu=zh_CN.UTF-8
set helplang=cn

set nospell     " disable spell checking

" set nofoldenable    " disable folding

""Toggle Menu and Toolbar
" set guioptions-=m
" set guioptions-=T


" 设置NeoComplCache不自动弹出补全列表
let g:neocomplcache_disable_auto_complete=1
let g:neosnippet#disable_runtime_snippets = { "_": 1, }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置模拟windows的复制粘帖
" vmap <C-c> "+y
" vmap <C-x> "yd
" nmap <C-v> "+p
" vmap <C-v> "+p
nmap <C-a> ggvG$

" 模仿MS Windows中的保存命令: Ctrl+S
" imap <C-s> <Esc>:wa<cr>i<Right>
" nmap <C-s> :wa<cr>

" 将所选中内容复制到系统
map cy "+y

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" tab navigation like firefox
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" 设置 nerdtree 
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 30
