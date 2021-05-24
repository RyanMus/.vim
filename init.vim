" 如果输入过程中有卡顿或者其他问题,是有:imap查看所有映射键值查找对应动作分析
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=UTF-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the config down below
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

" Now the actual plugins:

" Code commenter
Plug 'scrooloose/nerdcommenter'
" Better file browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Class/module browser tag
Plug 'preservim/tagbar'
Plug 'liuchengxu/vista.vim'
" Search results counter
"Plug 'vim-scripts/IndexedSearch'
" A couple of nice colorschemes
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'cohlin/vim-colorschemes'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'Konfekt/FastFold' " 代码折叠
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'ianding1/leetcode.vim'
Plug 'w0rp/ale' " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
" Just to add the python go-to-definition and similar features, autocompletion
Plug 'davidhalter/jedi-vim'
" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
Plug 'sheerun/vim-polyglot'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
" Highlight matching html tags
Plug 'valloric/MatchTagAlways'
" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'ayu-theme/ayu-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'connorholyday/vim-snazzy'
Plug 'w0ng/vim-hybrid'
Plug 'luochen1990/rainbow'
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
" Generate html in a simple way
Plug 'mattn/emmet-vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Linters
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'  ":undotree 查看目前更记录
Plug 'rizzatti/dash.vim'
Plug 'yegappan/mru'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Track the engine.
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
"tab标签的设定, session 和buffer--->help xtabline.txt
Plug 'mg979/vim-xtabline'
"vim 启动页面
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 代码补全, 见配置并需要安装各语言依赖

" 保留为最后一个插件加载
Plug 'ryanoasis/vim-devicons'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" no vi-compatible
set nocompatible
syntax on
" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
" always show status bar
set laststatus=2
set rulerformat=%15(%c%V\ %p%%%)
" incremental search
set incsearch
" highlighted search results
set hlsearch
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set cursorline
autocmd InsertLeave,WinEnter * if &ft !=# 'clap_input' | set cursorline | endif
autocmd InsertEnter,WinLeave * set nocursorline
" 恢复上次文件打开位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set fo+=mB                       "打开断行模块对亚洲语言支持
"set list  " 开启对于制表符（tab）、行尾空格符（trail）、行结束符（eol）等等特殊符号的回显
set listchars=tab:→\ ,trail:π,extends:↷,precedes:↶
set backspace=indent,eol,start  " “缩进位置”，“行结束符”，“段首”。这样设置可以使得 backspace 键在这三个特殊的位置也能进行回删动作
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoread                     " Set to auto read when a file is changed from the outside
set autowrite                    " Set to auto write when a file is changed from the outside
set showcmd         " 在屏幕右下角显示未完成的指令输入
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"显示相对行号
set relativenumber
" when scrolling, keep cursor 3 lines away from screen border, less 3 then
" show +12
" 垂直滚动的设置, 光标距离顶部/底部的位置（单位：行）
set scrolloff=3
set scrolljump=12
"水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
set sidescrolloff=15
"离开 Insert 模式时自动切换至英文输入法
set noimdisable
" 控制台响铃
" 出错时，不要发出响声
set belloff=all
"出错时，发出视觉提示，通常是屏幕闪烁
set t_vb= "close visual bell
" 使用系统粘贴板替换neovim的unnamepdplus
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" better backup, swap and undos storage for vim (nvim has nice ones by
" default)
set directory=~/.vim/dirs/tmp     " directory to place swap files in
"set backup                        " make backup files
"set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" syntax highlight on
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
inoremap <silent>jk             <Esc>
inoremap <silent>jj              <Esc>
nnoremap  Y y$
nnoremap <leader>?      :Maps<cr>
noremap  <c-j>          <c-w>j
noremap  <c-k>          <c-w>k
noremap  <c-h>          <c-w>h
noremap  <c-l>          <c-w>l
vnoremap  <leader>al    :EasyAlign ** \|<CR>
vnoremap  <leader>a=    :EasyAlign ** =<CR>
command! W w !sudo tee % > /dev/null
nnoremap <silent><nowait> <leader>s  :w<CR>
nnoremap <silent><nowait> <leader>q  :q<CR>
noremap  <leader>i      :IndentLinesToggle<CR>
noremap  <nowait> <leader>e      :MRU<CR>
nnoremap <nowait> <leader>u      :UndotreeToggle<CR>
noremap  <leader>td     :TaskList<cr>
noremap  <leader>tn     :tabnew<cr>

"buffers
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bs :Buffers<CR>
nnoremap <silent> <Leader>bb :bp<cr>

"windows
noremap  <leader>wj    :belowright split<cr>
noremap  <leader>wk    <c-w>s
noremap  <leader>wl    :rightb vsplit<cr>
noremap  <leader>wh    <c-w>v
noremap  <leader>wn    :term<cr>
noremap  <leader>=     <c-w>10+
noremap  <leader>-     <c-w>10-
noremap  <leader>]    <c-w>10>
noremap  <leader>[     <c-w>10<

for s:i in range(1, 9)
  " <Leader>[1-9] move to window [1-9]
  execute 'nnoremap <Leader>w'.s:i ' :'.s:i.'wincmd w<CR>'

  " <Leader><leader>[1-9] move to tab [1-9]
  execute 'nnoremap <Leader>'.s:i s:i.'gt'
endfor
unlet s:i

nnoremap <C-n>           gt
nnoremap <C-p>           gT
map gf :tabnew <cfile><cr>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-B> <Left>
cnoremap <C-a> <Home>
set iskeyword+=_,$,#,@,%,-       " 带有如下符号的单词不要被换行分割
set report=0       " Always report changed lines

"{{{ for easymotion move fast
    nmap <leader><leader> <Plug>(easymotion-lineanywhere)
    nmap <localleader>j <Plug>(easymotion-j)
    nmap <localleader>k <Plug>(easymotion-k)
    nmap w <Plug>(easymotion-w)
    nmap b <Plug>(easymotion-b)
"}}}

" Fugitive {{{
    nnoremap <leader>gd :Gvdiff<cr>
    nnoremap <leader>gs :Gstatus<cr>
    nnoremap <leader>gw :Gwrite<cr>
    nnoremap <leader>ga :Gadd<cr>
    nnoremap <leader>gb :Gblame<cr>
    nnoremap <leader>gr :Gread<cr>
    nnoremap <leader>gc :Gcommit<cr>
    nnoremap <leader>gp :Gpush<cr>
    nnoremap <leader>gm :Gmove<cr>
    nnoremap <leader>gl :! git gl -18<cr>:wincmd \|<cr>
    nnoremap <leader>gg :diffget //2<cr>
    nnoremap <leader>gh :diffget //3<cr>

    augroup ft_fugitive
        au!
        au BufNewFile,BufRead .git/index setlocal nolist
    augroup END
"}}}

"{{{mru
    let MRU_Max_Entries = 100
    let MRU_Window_Height = 15
    let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
"}}}

" ------------------------------------------------
" For dash.vim
" 使用 ,ds 在Dash中搜索当前光标下的关键字
" more see :help dash
" ------------------------------------------------
nmap <silent> <leader>wd <Plug>DashSearch

" ------------------------------------------------
"  For commentary
" ------------------------------------------------
autocmd FileType apache setlocal commentstring=#\ %s

" remove ugly vertical lines on window division
set fillchars+=vert:\

" ------------------------------------------------
" For pydocstring
nmap <silent> <Leader>id <Plug>(pydocstring)

" ------------------------------------------------
" For leetcode
"When non-zero, use LeetCode China accounts instead.
let g:leetcode_china = 1
let g:leetcode_solution_filetype = 'python3'
let g:leetcode_browser = 'firefox'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

let &t_Co = 256
"colorscheme desert
colorscheme gruvbox
"colorscheme neodark
"colorscheme py-darcula

" setting for gruvbox
set background=dark           "Setting dark/light mode
" Changes dark mode contrast. Overrides g:gruvbox_contrast option. Possible values are soft, medium and hard.
"let g:gruvbox_contrast_dark = "hard"
let g:neodark#background = '#202020'
"let g:neodark#terminal_transparent = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" +=============================== rainbow Parentheses ==============================+ "
" [({})]
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['#FFE66F', '#00FFFF', '#46A3FF', '#AAAAFF', '#FFB5B5'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

set foldmethod=indent " 设置默认折叠方式为缩进
set foldlevelstart=99 " 每次打开文件时关闭折叠
" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.py :Isort
let g:vim_isort_python_version = 'python3'
autocmd FileType markdown  noremap <leader>mp :MarkdownPreview<cr>
"修改配置文件，自动加载
autocmd! bufwritepost init.vim source $HOME/.config/nvim/init.vim

" Tagbar -----------------------------
" toggle tagbar display
map <leader>tl :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" toggle nerdtree display
noremap  <leader>n      :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <localleader>l :NERDTreeFind<CR>
" 总是显示Bookmark
let NERDTreeShowBookmarks = 1
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,*.pyo,*.jpg,*.gif,*.png,*.pdf,*/tmp/*,*.so,*.zip,*.tgz
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" 图片前后的字符默认两个空格
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '


" don;t show these file types
 let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.dll$', '*.o$','*.jpg','*.png$', '\.zip$', '\.tgz', '\.pdf$']
" 如果用t T i 打开文件后自动退出NERDTree,
let NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers=0
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

"显示缩进线
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0

" Fzf ------------------------------

" find file in current dir
nmap <leader>f :Files<CR>
" tags (symbols) in current file finder mapping
nmap <leader>g :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wt :execute ":Tags " . expand('<cword>')<CR>
" general code finder in all files
nmap <leader>bt :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wf :execute ":Lines " . expand('<cword>')<CR>

" Jedi-vim ------------------------------
" Disable autocompletion (using coc-vim instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition use coc code navigate
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = 'ga'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------
"进行搜索，同时不自动打开第一个匹配的文件, 直接回车搜索光标所在word
nnoremap <Leader>ws :Ack!<Space>
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
endif
let g:ack_default_options =" -s -H --nogroup --column --smart-case --follow -m 10"
let g:ackhighlight = 1

" ------------------------------------------------
" For Signify see :help Signify
" ------------------------------------------------
let g:signify_disable_by_default=0
nnoremap <leader>sn :SignifyToggle<CR>
nnoremap <leader>sd :SignifyDiff<CR>
"防止标志不清晰或和背景补一个颜色
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
hi SignifySignAdd    ctermfg=2
hi SignifySignDelete ctermfg=9
hi SignifySignChange ctermfg=172
let g:signify_sign_change = '*'

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git']
" mappings to jump to changed blocks
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)

" nicer colors
hi DiffAdd           cterm=bold ctermbg=none ctermfg=2
hi DiffDelete        cterm=none ctermbg=none ctermfg=9
hi DiffChange        cterm=none ctermbg=none ctermfg=25
hi DiffText          cterm=bold ctermbg=none ctermfg=1


hi! PmenuSel        ctermbg=Magenta ctermfg=0
hi! jediFat         ctermfg=Magenta ctermbg=black

" ------------------------------------------------
" For airline
" ------------------------------------------------
" 有些图标显示不正常, 首先要装好nerd-font和powerline的字体. 然后在iterm中单独设置
" non-ASCII-Font
set guifont=Source\ Code\ Pro\ for\ Powerline:h15
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_theme = 'papercolor'           "papercolor,angr,luna,darcula"
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_alt_sep = '❯'
let g:airline_right_alt_sep = '❮'
" ------------------------------------------------
" For ale
" 使用 flake8 做python3的代码检查，pylint检查太严格
" 使用 autopep8, yapf等做代码修正，快捷键定义为 ,pe
" normal下gk, gj跳转到上一个，下一个错误，lc关闭或者打开错误列表
" more see :help ale
" ------------------------------------------------
let g:ale_linters_explicit = 0 "除g:ale_linters指定，其他不可用
let g:ale_linters = {
\   'cpp': ['cppcheck','clang','gcc'],
\   'c': ['cppcheck','clang', 'gcc'],
\   'python': ['flake8'],
\   'rust': [ 'cargo', 'rls', 'rustc' ],
\   'bash': ['shellcheck'],
\   'go': ['golint'],
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'html': ['htmlhint', 'prettier'],
\   'yaml': ['yamllint', 'prettier'],
\}
"let g:ale_linters_ignore = {'python': ['pylint']}
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_fixers = {
\   'python': ['autopep8', 'black', 'isort'],
\   'rust': ['rustfmt'],
\   'javascript': ['eslint'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" let g:ale_set_hightlights = 1
" 禁用 ale的lsp，使用 coc的lsp，需在插件加载前关闭ale的lsp
let g:ale_disable_lsp = 1
let g:ale_change_sign_column_color = 0
" 警告保持打开
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_format = '[%linter%][%severity%]: %s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0 "打开quitfix对话框
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --max-line-length=1000 --extend-ignore= --ignore=E121,F403'
let g:ale_python_black_options = '-l 110'
nmap gk <Plug>(ale_previous_wrap)
nmap gj <Plug>(ale_next_wrap)
nnoremap <leader>at :ALEToggle<CR>
"format代码 cs short for code format
nnoremap <leader>af :ALEFix<cr>

" Include user's custom nvim configurations
if using_neovim
    let custom_configs_path = "~/.config/nvim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif

if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif

" repeat.vim .重复动作
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"for vim-which-key
set timeoutlen=300
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


"设置iterm透明度,显示背景图片
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

"coc settings
"To check and see if the coc service is running, use command :checkhealth in neovim (not supported by vim)
"Set g:coc_node_path variable to specify which node executable to start coc.nvim service from.
"Another useful command is :CocInfo — use it after the service has started to get some useful information on it.
"Run :CocConfig, which will open main config file ~/.config/nvim/coc-settings.json
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-eslint',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-snippets',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'https://github.com/rodrigore/coc-tailwind-intellisense',
	\ 'coc-tasks',
    \ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

let g:python3_host_prog = '/usr/local/bin/python3'
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-i> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
"nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nmap <leader>cf :call CocAction('format')<cr>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nmap <leader>zz :call     CocAction('fold', <f-args>)<cr>

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
noremap <silent><nowait> <leader>cl  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
noremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>
noremap <LEADER>tt :Vista coc<CR>
" -----------------------------------------------
 let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
 let g:vista#renderer#enable_icon = 1
 let g:vista_default_executive = 'ctags'
 let g:vista_fzf_preview = ['right:50%']
 let g:vista#renderer#enable_icon = 1
 let g:vista#renderer#icons = {
             \   "function": "\uf794",
             \   "variable": "\uf71b",
             \  }
 let g:scrollstatus_size = 15
"------------------------------------------------
"
" 通过startify进入的文件,chdir到.git .svn项目根目录
let g:startify_change_to_vcs_root = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" markdown中的代码分割语法显示
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
" 翻译功能 coc-translator
nmap ts <Plug>(coc-translator-p)
