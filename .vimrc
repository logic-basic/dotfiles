
call plug#begin('~/.vim/plugged')

" themes
Plug 'flazz/vim-colorschemes'

" project manager
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'scrooloose/nerdtree',{ 'on' : 'NERDTreeToggle'}
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter' 
Plug 'vim-scripts/DoxygenToolkit.vim' 
" cpp dev
Plug 'Chiel92/vim-autoformat' 
Plug 'rhysd/vim-clang-format' 
Plug 'derekwyatt/vim-fswitch'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" auto complete
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" 补全双括号等
Plug 'Raimondi/delimitMate'

" 批量更改
Plug 'terryma/vim-multiple-cursors'

" 启动界面
Plug 'mhinz/vim-startify'

" markdown
Plug 'suan/vim-instant-markdown'

" other
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'embear/vim-foldsearch'

call plug#end()

" nerdtree 
map <C-a> :NERDTreeToggle<CR>
let NERDTreeIgnore=[
    \'\.pyc$', '\.pyo$', '\.obj$',
    \'\.o$', '\.so$', '\.egg$',
    \'^\.git$', '^\.svn$', '^\.hg$' ]

let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" autoformat
nnoremap <F3> :Autoformat<CR>

" colorscheme 
colorscheme candycode

set ignorecase

" number
set number

" 默认开启语法高亮
syntax on

" 高亮当前行
set cursorline
" 根据256的颜色进行设计当前行的高亮颜色，可参考256颜色图
hi CursorLine cterm=NONE ctermbg=238

set nocompatible

" autocmd InsertLeave * se nocul

" tabs
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

" 绑定 space 到 : 按键
noremap <space> :

let mapleader = ';'

" Youcompleteme

let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"

set completeopt=longest,menu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0

" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=0

"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1

"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['C-j']
let g:ycm_key_list_previous_completion = ['C-k']

" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}

map <C-e> :YcmCompleter GoToDefinitionElseDeclaration<cr>
"nnoremap <leader>gg :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
map <C-y> :ClangFormat<cr>

map <F2> :pyf <path-to-this-file>/clang-format.py<cr>
imap <F2> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>

" ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" nerdcommenter
map <C-m> <Plug>NERDCommenterToggle

cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" doxygentoolkit
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_commentType="C++"
"
let g:DoxygenToolkit_licenseTag =  ""
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "\<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "        Copyright (C) 2005 - 2018 CVTE - All Rights Reserved\<enter>"

let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "          __  __                  _   _           _       \<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "         |  \\/  |   __ _  __  __ | | | |  _   _  | |__   \<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "         | |\\/| |  / _` | \\ \\/ / | |_| | | | | | | '_ \\¨ \<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "         | |  | | | (_| |  >  <  |  _  | | |_| | | |_) | \<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "         |_|  |_|  \\__,_| /_/\\_\\ |_| |_|  \\__,_| |_.__/  \<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "\<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "                            dangjiahe\<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "                       dangjiahe@cvte.com\<enter>"
let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "\<enter>"
let g:DoxygenToolkit_authorName="dangjiahe"

" 替换单词
nnoremap <Leader>r "_diwP
