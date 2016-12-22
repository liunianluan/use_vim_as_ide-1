let mapleader=','
let g:solarized_termcolors=256    "solarized主题设置在终端下的设置

syntax on    "开启语法高亮

set nocompatible "关闭兼容模式
set number " 显示行号
set clipboard=unnamed "使用系统剪切板
set guioptions-=r " 隐藏滚动条
set guioptions-=L
set guioptions-=b
set showtabline=0 "隐藏顶部标签栏
set background=dark        "设置背景色
set nowrap    "设置不折行
set fileformat=unix    "设置以unix的格式保存文件
set cindent        "设置C样式的缩进格式
set tabstop=4    "设置table长度
set shiftwidth=4        "设置shift宽度
set showmatch    "显示匹配的括号
set scrolloff=5        "距离顶部和底部5行
set laststatus=2    "命令行为两行
set fenc=utf-8      "文件编码
set backspace=2
set mouse=a        "启用鼠标
"set selection=exclusive
"set selectmode=mouse,key
set matchtime=5
set ignorecase        "忽略大小写
set incsearch "开启实时搜索功能
set hlsearch        "高亮搜索项
set noexpandtab        "不允许扩展table
set whichwrap+=<,>,h,l "设置可移出当前行
set autoread "文件在外部修改，自动重新载入
set cursorline        "突出显示当前行
"set cursorcolumn        "突出显示当前列

vnoremap <Leader>y "+y
"nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>M %

nnoremap # *
nnoremap * #
nnoremap U <C-r>
nnoremap <Leader>= gg=G<CR>

nnoremap nw <C-W><C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd BufWritePost $MYVIMRC source $MYVIMRC "让配置变更立即生效

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gcmt/wildfire.vim'
Plugin 'Lokaltog/vim-easymotion'
call vundle#end()
filetype plugin indent on
filetype indent on

colorscheme molokai
syntax enable
syntax on

"默认配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径
let g:ycm_path_to_python_interpreter='/usr/bin/python'
"是否开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"字符串中也开启补全
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 定义跳转
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"F2开启和关闭树
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeShowHidden=0
"显示书签
let NERDTreeShowBookmarks=1
"设置忽略文件类型
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小
let NERDTreeWinSize=25
"默认打开树
autocmd VimEnter * NERDTree

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"autopep8设置
let g:autopep8_disable_show_diff=1

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sf :CtrlSF<CR>

" 快捷替换
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 快速选中结对符内的文本
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

