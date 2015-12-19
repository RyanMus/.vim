"{{{vundle setting
    set nocompatible               " be iMproved
    filetype on                   " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
     " required! 
    Bundle 'gmarik/vundle'
    Bundle 'tpope/vim-fugitive'
    "non github repos
    Bundle 'taglist.vim'
    Bundle 'Shougo/unite.vim'
    Bundle 'easymotion/vim-easymotion'

    "{{{ for easymotion move fast 
        map  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)
        map  n <Plug>(easymotion-next)
        map  N <Plug>(easymotion-prev)
        nmap w <Plug>(easymotion-w)
        nmap b <Plug>(easymotion-b)
        nmap s <Plug>(easymotion-sn)
    "}}}

    "{{{for php
        Bundle 'php.vim'
        "Bundle 'rayburgemeestre/phpfolding.vim'
        "Bundle 'm2mdas/phpcomplete-extended'
    "}}}

    "{{{for python
        "need install pep8 yum install Python-pep8"
        Bundle 'klen/python-mode'
        Bundle 'vim-scripts/Pydiction.git'     
        Bundle 'lambacck/python_matchit.git'
    "}}} 

    "{{{ "productivly
        Bundle 'scrooloose/syntastic.git'
        Bundle "vim-scripts/matchit.zip"
        Bundle 'mru.vim'
        Bundle 'surround.vim'
        "Gundo is a Vim plugin for visualizing your undo tree to make it usable.  need vim7.3 and python support.
        Bundle 'Gundo'
        Bundle 'mileszs/ack.vim.git'
        Bundle 'The-NERD-tree'
    "}}}

    "{{{ autocomplete
        Bundle 'ervandew/supertab.git'
        "Bundle 'AutoComplPop'
        Bundle 'snipMate'
    "}}}

"{{{The search options affect
    set showcmd	    	" Show (partial) command in status line.
    set hls
    set ignorecase		" Do case insensitive matching
    set smartcase		" Do smart case matching
    set incsearch		" Incremental search
    set gdefault
    set nolazyredraw 	"Don't redraw while executing macros'"
    command! -nargs=1 Silent
                \ | execute ':silent !'.<q-args>
                \ | execute ':redraw!'
    set fileencoding=utf-8 "default new fileencoding
    " 恢复上次文件打开位置
    set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"}}}

"{{{The simple look like
    set number			
    set cursorline		
    set mouse=a		" Enable mouse usage (all modes)
    set scrolloff=10 "始终保持光标上下有至少5行
    set sidescrolloff=10 
    set wmw=12 " set the min width of a window to 0 so we can maximize others
    set wmh=1 " set the min height of a window to 0 so we can maximize others
"}}}

"{{{statusline set
    set laststatus=2    " always show the status line
    set wildmenu
    set wildmode=list:longest,full
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,\*.jpg,*.gif,*.png,*.pdf
    "设置状态行，使其能额外显示文件的编码信息 
    set statusline=\ %F\ %m%<%r\ \ %10l/%L:%c\->%p%%\ \ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",bom\":\"\")}]\ \ \ [%{&ff}/%Y]%<\ \ \ \ \ \ \ \ \ \ \ PWD:%{CurDir()}\ \ \ \ %{strftime('%H:%M\ %p')}\ \ \ \ \ \ \ %{fugitive#statusline()}
    function! CurDir()
        let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
            return curdir
        endfunction
    "}}}

    "{{{the map leader shortcut and the keymap
        noremap <C-J> <C-W>j
        noremap <C-K> <C-W>k
        noremap <C-H> <C-W>h
        noremap <C-L> <C-W>l
        let mapleader = ","
        let g:mapleader = ","
        noremap  en      :cn<CR>
        noremap  ep      :cp<CR>
        noremap  <leader>w      :w<CR>
        noremap  <leader>!      :w !sudo tee "%"<CR>
        noremap  cn             :cn<CR>
        noremap  cp             :cp<CR>
        noremap  <leader>q      :q<CR>
        noremap  <leader>!      :w !sudo tee % >/dev/null<CR>
        noremap  <leader>8     :set fileencoding=utf-8<cr>:w<cr>
        noremap  <leader>e      :MRU<CR>
        noremap  <leader>n      :NERDTreeToggle<CR>
        noremap  <leader>t      :TlistToggle<CR>
        noremap  <leader>tp     :set paste!<CR>
        noremap  <leader>s     <Esc>:Ack!
        noremap =              <c-w>10+
        noremap -              <c-w>10-
        noremap <leader>>             <c-w>10>
        noremap <leader><             <c-w>10<
        noremap <C-n>           gt
        noremap <C-p>           gT
        nnoremap <space>         za
        vnoremap <space>         za
        nnoremap n               nzz
        nnoremap N               Nzz
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
    "}}}

    "{{{ 文本格式和排版
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
        set autowrite                    " Set to auto write when a file is changed from the outside
        set autochdir                    "Auto change the global dir of the current windows
    "}}}

    "{{{abbrevation
        abb echor echo -e "\033[31m msg \033[0m"  
        abb echop echo -e "\033[45m msg \033[0m"
        abb echob echo -e "\033[44m msg \033[0m"
        iab idate <c-r>=strftime("%Y-%m-%d")<CR>
        iab inow  <c-r>=strftime("%Y-%m-%d %H:%M")<CR>
        iab imail lijun877@gmail.com
    "}}}
    let g:vimim_disable_chinese_punctuation=1
    let g:vimim_disable_seamless_english_input=1
    " paste from clipboard
    function! Yank()
        execute "normal \"+y"
    endfunction
    function! Paste()
        execute "set paste"
        execute "normal \"+p"
        execute "normal l"
        execute "set nopaste"
    endfunction
    
    noremap Y            <ESC>:call Yank()<CR><ESC>
    noremap <leader>p     <ESC>:call Paste()<CR><ESC>
    noremap <leader>y     "+yy
    "}}}

    "{{{setting options of mksession.
        "set sessionoptions+=resize,winpos
        "set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
        "}
        set diffopt=filler,vertical   " diffsplit {filename} open the $filename in the new windows vertically and compare the with the current file.
        "let @#='I<html>A<\hmtl>' " type let @q=' then type <C-R> <C-R> q' store the marco saved in register q. viewing the content of the register q (:reg q)
        autocmd! bufwritepost *.vimrc source $HOME/.vimrc
    "}}}

"{{{pydict
    let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
"}}}

"{{{mru
    let MRU_Max_Entries = 100
    let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
"}}}

"{{{Gundo设置
    let g:gundo_width = 40
    let g:gundo_preview_height = 20
    let g:gundo_right = 0
    let g:gundo_help = 0
    nnoremap <leader>u :GundoToggle<CR>
"}}}

"{{{ CTags的设定
    "ctags的bin文件路径
    "let Tlist_Ctags_Cmd='/usr/bin/ctags'
    " 按照名称排序
    let Tlist_Sort_Type = "name"
    " 在右侧显示窗口
    let Tlist_Use_Right_Window = 1
    " 压缩方式 Remove extra information and blank lines from the taglist window.
    let Tlist_Compact_Format = 1
    " 如果只有一个buffer，kill窗口也kill掉buffer
    let Tlist_Exit_OnlyWindow = 1
    "auto open Tlist when vim open
    "let Tlist_Auto_Open = 0 
    " 不要显示折叠树
    let Tlist_Enable_Fold_Column = 0
    " taglist 窗口宽度
    let Tlist_WinWidth = 27
    " no inc the width of the windows
    let Tlist_Inc_Winwidth = 1 
    " Close tag folds for inactive buffers.
    let Tlist_File_Fold_Auto_Close = 0 
    "To process files even when the taglist window is not open.
    let Tlist_Process_File_Always = 1
    "display the tags defined only in the current buffer
    let Tlist_Show_One_File = 1 
    "打开taglist并且切换焦点到taglist窗口
    let Tlist_GainFocus_On_ToggleOpen=1
"}}}

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

"{{{ 自动补全设置supertab snippmate omincomplete
    "let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    "let g:SuperTabDefaultCompletionType = "<c-n>"
    "result or exited the completion mode, the default completion type is restored.
    set completeopt=longest,menuone,preview
    set complete=.,w,b,u,t
    let g:SuperTabLongestEnhanced =1
    let g:SuperTabLongestHighlight = '1' "若设置为1 ,预先选中一个补全选项,可以直接回车使用这个补全选项
    let g:SuperTabMidWordCompletion = '1' "禁止在字中间启用completion
"}}}

"{{{ omincomplete
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType python runtime! autoload/pythoncomplete.vim
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
"}}}

"{{{The Colors
    colorscheme desert
    " 状态行颜色
    hi StatusLine      guifg=yellow guibg=black gui=reverse,bold 
    hi StatusLine      ctermfg=yellow  cterm=bold,reverse
    hi search          ctermfg=black ctermbg=green 
    hi wildmenu        ctermbg=green
    "当前窗口的状态栏颜色
    hi modemsg         ctermfg=1
    "hi CursorLine     ctermfg=DarkYellow  guibg=DarkYellow
    "设置自动补全跳出菜单颜色,pmenusel是选择时的颜色.note:guifg guibg only effected when vim has the gui
    hi! Pmenu           ctermbg=7 ctermfg=0  cterm=reverse
    hi! PmenuSel        ctermbg=Magenta ctermfg=0 
    hi! Pmenu           guibg=yellow guifg=black  cterm=reverse
    hi! PmenuSel        guifg=black guibg=Magenta
"}}}

"{{{程序相关的设定
    "只对c,cpp,java,pl,sh,py格式的文件启动自动缩进.注释进行了自动缩进 fold按缩进程度进行代码块的收放
    autocmd Filetype python  abb pdb import pdb; pdb.set_trace()
    autocmd FileType python setlocal foldmethod=indent foldlevel=99 formatoptions=croql textwidth=79 
    autocmd FileType c,cpp,java,perl,sh setlocal foldmethod=marker foldmarker={,} foldlevel=99 formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
    autocmd FileType vim setlocal  foldmethod=marker foldmarker={{{,}}}
    "highlight characters after column 80.
    autocmd FileType c,cpp,python :match IncSearch /\%>79v.\+/  
"}}}

" Python-Mode {{{
let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
let g:pymode_lint_cwindow = 0 "do not open quikfix windows when find error
let g:pymode_lint_ignore = "C010"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_rope_always_show_complete_menu = 0
let g:pymode_run_key = '<leader>r'
let g:pymode_rope_goto_definition_bind = '<leader>d'
let g:pymode_rope_goto_definition_cmd = 'new'
" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_rope_rename_bind = '<leader>rn'
" Highlight "print" as function
let g:pymode_syntax_print_as_function = 1
let g:pymode_rope = 1
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion_bind = '<Tab>'
let g:pymode_folding = 1
" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1
" }}}

" syntastic setting {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"check for php
let g:syntastic_php_checkers = ['php', 'phpcs']

"check for python
let g:syntastic_python_checkers = ['pylint','pep8']
"}}}

" Fugitive {{{

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gl :! git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END
"}}}
