set nocompatible               " be iMproved
filetype on                   " required!
set sw=4                         "set softswitch to 4
set tabstop=4                     "set tab to 4
set softtabstop=4
set expandtab                       "expand tab to 4 space
set showcmd            " Show (partial) command in status line.
set hls
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set incsearch        " Incremental search
set gdefault
set nolazyredraw     "Don't redraw while executing macros'"
set cursorline
let mapleader = ","
let g:mapleader = ","
noremap  <leader>e      :MRU<CR>
noremap  <leader>tp     :set paste!<CR>
noremap  <leader>n      :NERDTreeToggle<CR>
nnoremap <leader>u      :GundoToggle<CR>
hi StatusLine      ctermfg=yellow  cterm=bold,reverse
set laststatus=2    " always show the status line
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,\*.jpg,*.gif,*.png,*.pdf
"设置状态行，使其能额外显示文件的编码信息
set statusline=\ %F\ %m%<%r\ \ %10l/%L:%c\->%p%%\ \ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",bom\":\"\")}]\ \ \ [%{&ff}/%Y]%<\ \ \ \ \ \ \ \ \ \ \ PWD:%{CurDir()}\ \ \ \ %{strftime('%H:%M\ %p')}\ \ \ \ \ \ \
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/lijunya/', "~/", "g")
        return curdir
    endfunction
"{{{ NERDTree的设定
    " 如果用t T i 打开文件后自动退出NERDTree,
    let NERDTreeQuitOnOpen = 1
    " 总是显示Bookmark
    let NERDTreeShowBookmarks = 1
    " 总是显示行号
    let NERDTreeShowLineNumbers=0
    " NERDTree 窗口大小
    let NERDTreeWinSize = 25
    " A 可使NERDTree窗口最大化Toggle it.
    "过滤文件,使用正则表达式
    let NERDTreeIgnore=['\.pdf$','\.doc','\.wmv','\.flv','\.lnk','\.xlsx','\.tar.gz','\.tgz','\.zip']
"}}}

