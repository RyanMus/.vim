"""""""""""""""""""""""""""
"Install 
""""""""""""
"env GIT_SSL_NO_VERIFY=true git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"execute command bundleInstall! in vim 
"plugin 
"{
"pep8 is a simple program that just checks if your python code is pep-8 compliant need pep8 is installed and vim-plugin pep8.vim
    "http://www.vim.org/scripts/script.php?script_id=2914
"require vim7.3 and python2.7 so compile vim with python's path 
"./configure --prefix=/usr/local --enable-multibyte --with-features=big --disable-selinux --enable-pythoninterp
"--with-python-config-dir=/usr/local/lib/python2.7/config/  --enable-gui=no  
"need more pep8 and py.test to code and test python 
"}
"sudo apt-get install vim-gnome 
"make you can use the system clipboard "+p { the selection content "*p }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"vundle setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
 set nocompatible               " be iMproved                                       
 filetype off                   " required!                                         

 set rtp+=~/.vim/bundle/vundle/                                                     
 call vundle#rc()

 " let Vundle manage Vundle
     " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 "non github repos
"require Exuberant ctags for the taglist.vim  sudo apt-get install exuberant-ctags
 Bundle 'taglist.vim'
 Bundle 'TxtBrowser'
 Bundle 'bufexplorer.zip'
 Bundle 'AutoComplPop'
 Bundle 'snipMate'
 Bundle 'mru.vim'
"pytest.vim  A simple way of running your tests (with py.test) from within VIM
 Bundle "alfredodeza/pytest.vim.git"
"pyflakes-vim highlights common Python errors like misspelling a variable name on the fly. It also warns about unused imports, redefined functions, etc
 Bundle 'pyflakes.vim'
 Bundle 'python.vim'
 Bundle 'vim-scripts/Pydiction.git'                                                                                                                                          
"tasklist.vim : mark some of your code as TODO or FIXME!
 Bundle 'vim-scripts/TaskList.vim.git'           
"Gundo is a Vim plugin for visualizing your undo tree to make it usable.  need vim7.3 and python support.
 Bundle 'Gundo'
 Bundle 'ervandew/supertab.git'
 Bundle 'The-NERD-tree'
 Bundle 'closetag.vim'
 Bundle 'matchit.zip'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The search options affect
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd	    	" Show (partial) command in status line.
set hls
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set nolazyredraw 	"Don't redraw while executing macros'"
command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'
set fileencoding=utf-8 "default new fileencoding
" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The simple look like
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number			
set cursorline		
set mouse=a		" Enable mouse usage (all modes)
set scrolloff=5 "始终保持光标上下有至少5行
set wmw=12 " set the min width of a window to 0 so we can maximize others
set wmh=1 " set the min height of a window to 0 so we can maximize others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"statusline set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2    " always show the status line
set wildmenu
set wildmode=list:longest,full
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,\*.jpg,*.gif,*.png,*.pdf
"设置状态行，使其能额外显示文件的编码信息 
set statusline=\ %F\ %m%<%r\ \ %10l/%L:%c\->%p%%\ \ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",bom\":\"\")}]\ \ \ [%{&ff}/%Y]%<\ \ \ \ \ \ \ \ \ \ \ PWD:%{CurDir()}\ \ \ \ %{strftime('%H:%M\ %p')}
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"the map leader shortcut and the keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
let mapleader = ","
let g:mapleader = ","
noremap  <leader>w      :w<CR>
noremap  <leader>q      :q<CR>
noremap  <leader>!      :w !sudo tee % >/dev/null<CR>
noremap  <leader>8      :set fileencoding=utf-8<cr>:w<cr>
noremap  <leader>r      :! ./% <CR>
noremap  <leader>e      :MRU<CR>
noremap  <leader>l      :set nohls!<CR>
noremap  <leader>n      :NERDTreeToggle<CR>
noremap  <leader>t     :TlistToggle<CR>
noremap  <leader>d     :TaskList<CR>
noremap   <leader>s      :mksession! Session.vim
noremap =              <c-w>7+
noremap -              <c-w>7-
noremap <C-n>           gt
noremap <C-p>           gT
noremap <space>         :
"tab for indent
nmap <tab>         V>
nmap <S-tab>       V<
vmap <tab>         >gv
vmap <S-tab>       <gv
"function like <c-w>f just open the file on new tab instead of current window
map gf :tabnew <cfile><cr>
"the shortcut  for cmdline like bash behavior
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <del>
map 0 ^
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin on
filetype plugin indent on
set sw=4			             "set softswitch to 4
set tabstop=4		             "set tab to 4 
set softtabstop=4
set expandtab      	             "expand tab to 4 space
"set virtualedit=onemore          " allow for cursor beyond last character
set shortmess+=filmnrxoOtT       " abbrev. of messages (avoids 'hit enter')
set autoindent 
set smartindent
set iskeyword+=_,$,#,@,%,-       " 带有如下符号的单词不要被换行分割
set fo+=mB                       "打开断行模块对亚洲语言支持
set backspace=2                  " 使回格键（backspace）正常处理indent, eol, start等
set nocompatible	
set history=1000
set viminfo+=!                   " make sure it can save viminfo 确保命令历史被记录在viminfo文件中.
set autoread                     " Set to auto read when a file is changed from the outside
set autochdir                    "Auto change the global dir of the current windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For windows and gui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("win32") || has("win64") || has("win32unix"))
    let g:isWin = 1
else
    let g:isWin = 0
endif
if (g:isWin)
    set lsp=0     "设置行距
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,chinese,gb2312
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_cn.utf-8
    "set guifont=Courier_New:h10:cANSI            "英文字体 字符集可以省略不写
    set guifont=Lucida_Sans_Typewriter:h10.5w6.5:cANSI  "英文字体 字符集可以省略不写.空格用_代替,h字高,w字宽.float型
    set guifontwide="幼圆:h11w2:cGB2312"                "中文字体，字体大小，字符集
    let Tlist_Ctags_Cmd='c:\ctags58\ctags.exe'
endif

if has("gui_running")
    let g:isGUI = 1
    set guioptions=
    set guitablabel=%N:\ %f "tab栏显示的格式:位置:文件名
    set t_Co=256
    set background=dark
    set linespace=5 "row space.
    set linespace=3 "row space.(两行的间距, 只对gvim有效.)
    "Ctrl+S实现保存，如果未命名文件名会提示你选择保存路径和文件名
    map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
    "set guifont=DejaVu\ Sans\ Mono:11
    "set guifontwide=文泉驿等宽微米黑:11
	hi StatusLine      guifg=yellow gui=reverse,bold guibg=black
	hi StatusLineNC    guifg=lightgray gui=reverse,bold guibg=black
else
    let g:isGUI = 0
endif

let g:vimim_disable_chinese_punctuation=1
let g:vimim_disable_seamless_english_input=1
" paste from clipboard
if (g:isWin)
    function! Yank()
        execute "normal \"+y"
    endfunction
else
    function! Yank()
        execute "normal \"*y"
    endfunction
endif
noremap Y            <ESC>:call Yank()<CR><ESC>
noremap <leader>p     <ESC>:call Paste()<CR><ESC>
noremap <leader>y     "+yy
function! Paste()
    execute "set paste"
    execute "normal \"+p"
    execute "normal l"
    execute "set nopaste"
endfunction
"插入模式缩写
iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab inow  <c-r>=strftime("%Y-%m-%d %H:%M")<CR>
iab imail lijun877@gmail.com
" 自动完成括号和引号
autocmd Filetype python inoremap = <c-[>li = <esc>i 
autocmd Filetype python inoremap + <esc>li + <esc>i 
autocmd Filetype python inoremap * <esc>li * <esc>i 
inoremap ( ()<c-[>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setting options of mksession.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set sessionoptions+=resize,winpos
"set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
"}
set diffopt=filler,vertical   " diffsplit {filename} open the $filename in the new windows vertically and compare the with the current file.
"let @#='I<html>A<\hmtl>' " type let @q=' then type <C-R> <C-R> q' store the marco saved in register q. viewing the content of the register q (:reg q)
autocmd! bufwritepost *.vimrc source $HOME/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pydict
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mru
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let MRU_Max_Entries = 100
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:pep8_map='<leader>8' 
let g:pyflakes_use_quickfix = 0
"Gundo设置
let g:gundo_width = 40
let g:gundo_preview_height = 20
let g:gundo_right = 0
let g:gundo_help = 0
nnoremap <leader>u :GundoToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags的bin文件路径
let Tlist_Ctags_Cmd='/usr/bin/ctags'
" 按照名称排序
let Tlist_Sort_Type = "name"
" 在右侧显示窗口
let Tlist_Use_Right_Window = 1
" 压缩方式 Remove extra information and blank lines from the taglist window.
let Tlist_Compact_Format = 1
" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exit_OnlyWindow = 1
"auto open Tlist when vim open
let Tlist_Auto_Open = 0 
" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0
" taglist 窗口宽度
let Tlist_WinWidth = 22
" no inc the width of the windows
let Tlist_Inc_Winwidth = 1 
" Close tag folds for inactive buffers.
let Tlist_File_Fold_Auto_Close = 1 
"To process files even when the taglist window is not open.
let Tlist_Process_File_Always = 1
"display the tags defined only in the current buffer
let Tlist_Show_One_File = 1 
"打开taglist并且切换焦点到taglist窗口
let Tlist_GainFocus_On_ToggleOpen=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 如果用t T i 打开文件后自动退出NERDTree,
let NERDTreeQuitOnOpen = 1
" 总是显示Bookmark
let NERDTreeShowBookmarks = 1
" 总是显示行号
let NERDTreeShowLineNumbers=0
" NERDTree 窗口大小
let NERDTreeWinSize = 22
" A 可使NERDTree窗口最大化Toggle it.
"过滤文件,使用正则表达式
let NERDTreeIgnore=['\.pdf$','\.doc','\.wmv','\.flv','\.ini','\.lnk','\.xlsx','\.tar.gz','\.tgz','\.zip']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动补全设置supertab snippmate omincomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
"result or exited the completion mode, the default completion type is restored.
set completeopt=menu,preview,longest
let g:SuperTabLongestEnhanced =1
let g:SuperTabLongestHighlight = '0' "若设置为1 ,预先选中一个补全选项,可以直接回车使用这个补全选项
let g:SuperTabMidWordCompletion = '0' "禁止在字中间启用completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" omincomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python runtime! autoload/pythoncomplete.vim
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
" 状态行颜色
hi StatusLine      guifg=yellow guibg=black gui=reverse,bold 
hi StatusLine      ctermfg=yellow  cterm=bold,reverse
hi search          ctermfg=black ctermbg=Magenta 
hi search          guifg=black guibg=Magenta 
hi wildmenu        ctermbg=magenta
"当前窗口的状态栏颜色
hi modemsg         ctermfg=1
"hi CursorLine     ctermfg=DarkYellow  guibg=DarkYellow
"设置自动补全跳出菜单颜色,pmenusel是选择时的颜色.note:guifg guibg only effected when vim has the gui
hi Pmenu           ctermbg=7 ctermfg=0  cterm=reverse
hi PmenuSel        ctermbg=Magenta ctermfg=0 
hi Pmenu           guibg=yellow guifg=black  cterm=reverse
hi PmenuSel        guifg=black guibg=Magenta
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TxtBrowser的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.pp setlocal ft=pp 
au BufRead,BufNewFile *  setfiletype txt
au BufRead,BufNewFile *.log setlocal ft=txt 
au FileType txt set formatoptions=tcr2mB nocindent textwidth=79 nofoldenable  comments& 
let g:default_web_browser='firefox'
"若firefox出现,already running cannot open new windows的错误时.先关闭firefox然后删除 "~/.mozilla/firefox/.parentlock 这个文件即可
let TxtBrowser_Title_Level = 3 "定义标题级数
let TxtBrowser_Dict_Url='http://www.iciba.com/text' "定义单词搜索引擎
au filetype txt let Tlist_Sort_Type = "order"
"noremap <leader>u  <ESC>:w<CR>:TlistUpdate<CR>
noremap <leader>g  <ESC>:TGoto<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"程序相关的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"只对c,cpp,java,pl,sh,py格式的文件启动自动缩进.注释进行了自动缩进 fold按缩进程度进行代码块的收放
autocmd FileType python set foldmethod=indent foldlevel=99 formatoptions=croql cindent textwidth=80 
autocmd FileType c,cpp,java,perl,sh set foldmethod=indent foldlevel=99 formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
"highlight characters after column 80.
autocmd FileType c,cpp,python :match IncSearch /\%>80v.\+/  
