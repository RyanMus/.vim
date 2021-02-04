" Fisa-vim-config, a config for both Vim and NeoVim
" http://vim.fisadev.com
" version: 12.0.1

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal 
" (if you aren't using one of those fonts, you will see funny characters here. 
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 0


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
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

" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Better file browser
Plug 'scrooloose/nerdtree'
" Class/module browser
Plug 'majutsushi/tagbar'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
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
" Async autocompletion
if using_neovim && vim_plug_just_installed
    Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
endif
Plug 'roxma/nvim-yarp'
Plug 'Konfekt/FastFold' " 代码折叠
Plug 'roxma/vim-hug-neovim-rpc'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
Plug 'ianding1/leetcode.vim'
Plug 'itchyny/vim-cursorword' "给光标下的单词增加下滑线
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " 代码补全, 见配置并需要安装各语言依赖, 如coc-python
Plug 'w0rp/ale' " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } "写python语言的各种操作, 见配置a

" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
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
Plug 'morhetz/gruvbox'
Plug 'kien/rainbow_parentheses.vim' 
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
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
Plug 'myusuf3/numbers.vim'
" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'

if using_vim
    " Consoles as buffers (neovim has its own consoles as buffers)
    Plug 'rosenfeld/conque-term'
    " XML/HTML tags navigation (neovim has its own)
    Plug 'vim-scripts/matchit.zip'
endif

" Code searcher. If you enable it, you should also configure g:hound_base_url 
" and g:hound_port, pointing to your hound instance
" Plug 'mattn/webapi-vim'
" Plug 'jfo/hound.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
 
if using_vim
    " A bunch of things that are set by default in neovim, but not in vim

    " no vi-compatible
    set nocompatible

    " allow plugins by file type (required for plugins!)
    filetype plugin on
    filetype indent on

    " always show status bar
    set laststatus=2

    " incremental search
    set incsearch
    " highlighted search results
    set hlsearch
    set ignorecase		" Do case insensitive matching
    set smartcase		" Do smart case matching
    set cursorline		
    autocmd InsertLeave * set cursorline
    autocmd InsertEnter * set nocursorline

    " 使用系统粘贴板替换neovim的unnamepdplus
    if has('clipboard')
      if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
      else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
      endif
    endif

    " syntax highlight on
    syntax on
    let mapleader = ","
    let g:mapleader = ","
    inoremap  jj             <esc>
    inoremap  <c-;>         <esc>
    inoremap  <c-i>         <esc>2l
    noremap  <c-j>          <c-w>j
    noremap  <c-k>          <c-w>k
    noremap  <c-h>          <c-w>h
    noremap  <c-l>          <c-w>l
    noremap  <leader>w      :w<CR>
    vnoremap  <leader>al    :EasyAlign ** \|<CR>
    vnoremap  <leader>a=    :EasyAlign ** =<CR>
    vnoremap  <leader>y     "+y
    noremap  <leader>!      :w !sudo tee "%"<CR>
    noremap  <leader>q      :q<CR>
    noremap  <leader>i      :IndentLinesToggle<CR>
    noremap  <leader>e      :MRU<CR>
    nnoremap <leader>u      :UndotreeToggle<CR>
    noremap  <leader>tp     :set paste!<CR>
    noremap  <leader>x     :TaskList<cr>
    noremap  <leader>z     :RainbowParenthesesToggle<cr>
    noremap  <leader>b     <c-o><c-o>
    noremap  <c-w>=        <c-w>15+
    noremap  <c-w>-        <c-w>15-
    noremap  <c-w>,        <c-w>15>
    noremap  <c-w>.        <c-w>15<
    nnoremap <C-n>           gt
    nnoremap <C-p>           gT
    nnoremap <space>        za
    vnoremap <space>        za
    map gf :tabnew <cfile><cr>
    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>
    cnoremap <C-B> <Left>
    cnoremap <C-a> <Home>
    set iskeyword+=_,$,#,@,%,-       " 带有如下符号的单词不要被换行分割

    " better backup, swap and undos storage for vim (nvim has nice ones by
    " default)
    set directory=~/.vim/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/.vim/dirs/backups " where to put backup files
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
end

" 恢复上次文件打开位置
"set viminfo='10,\"100,:20,%,n~/.vim/dirs/viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set fo+=mB                       "打开断行模块对亚洲语言支持
set backspace=2                  " 使回格键（backspace）正常处理indent, eol, start等
"set list  " 开启对于制表符（tab）、行尾空格符（trail）、行结束符（eol）等等特殊符号的回显
set backspace=indent,eol,start  " “缩进位置”，“行结束符”，“段首”。这样设置可以使得 backspace 键在这三个特殊的位置也能进行回删动作
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoread                     " Set to auto read when a file is changed from the outside
set autowrite                    " Set to auto write when a file is changed from the outside
set autochdir                    "Auto change the global dir of the current windows
set showcmd         " 在屏幕右下角显示未完成的指令输入
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

"{{{ for easymotion move fast 
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
nmap <silent> <leader>ds <Plug>DashSearch

" ------------------------------------------------
"  For commentary
" ------------------------------------------------
autocmd FileType apache setlocal commentstring=#\ %s

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" ------------------------------------------------
" For Fastflod
" ------------------------------------------------
set foldmethod=indent
set foldopen+=jump
set foldlevelstart=99
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
let g:python_folding = 1



" ------------------------------------------------
" For python-mode
" 使用python模式编写python代码，并禁用lint, flod, rope功能
" motion定义 [[, ]], [M, ]M 跳转到前后类，函数
" motion定义新文本对象 aM, aC, iM, iC, 如yaM,diC分表表示复制一个method, 删除一个Class
" 使用,r 运行当前python代码 (建议不要运行有输入的，或者超长时间超多输出的代码)
" more see :help pymode
" ------------------------------------------------
"let g:pymode_python = 'python3'
"let g:pymode_indent = 1
"let g:pymode_motion = 1
"let g:pymode_lint = 0
"let g:pymode_folding = 0
"let g:pymode_rope = 0
"let g:pymode_breakpoint = 0
"let g:pymode_run = 1
"let g:pymode_run_bind = '<Leader>r'


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

" use 256 colors when possible
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme vim-monokai-tasty
else
    "let &t_Co = 8
    let &t_Co = 128
    "colorscheme desert
    "colorscheme gruvbox
    "colorscheme neodark
    colorscheme py-darcula
endif

" 是否显示行数
let g:enable_numbers = 1

" setting for gruvbox 
set background=dark "Setting dark/light mode 
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

" parenthesis{([])}
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview

" when scrolling, keep cursor 10 lines away from screen border
set scrolloff=20

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.py :Isort
autocmd FileType markdown  noremap <leader>mp :MarkdownPreview<cr> 
autocmd! bufwritepost *vimrc source $HOME/.vimrc



" Tagbar -----------------------------
" toggle tagbar display
map <leader>t :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" toggle nerdtree display
noremap  <leader>n      :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,l :NERDTreeFind<CR>
" 总是显示Bookmark
let NERDTreeShowBookmarks = 1
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,*.pyo,*.jpg,*.gif,*.png,*.pdf

" don;t show these file types
 let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.dll$', '*.o$','*.jpg','*.png$', '\.zip$', '\.tgz', '\.pdf$','\.pyc$','\.pyo$','\.dll']
" 如果用t T i 打开文件后自动退出NERDTree,
let NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers=0

"只对c,cpp,java,pl,sh,py格式的文件启动自动缩进.注释进行了自动缩进 fold按缩进程度进行代码块的收放
autocmd Filetype python  iabb pdb import ipdb; ipdb.set_trace()<esc>
"autocmd FileType python,php setlocal foldmethod=indent foldlevel=99 
autocmd FileType c,cpp,java,perl,sh setlocal foldmethod=marker foldmarker={,} foldlevel=99 formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://

"显示缩进线
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0

" Fzf ------------------------------

" file finder mapping
nmap ,f :Files<CR>
" tags (symbols) in current file finder mapping
" tags (symbols) in all files finder mapping
nmap ,g :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":Tags " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>

" Deoplete -----------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'ignore_case': v:true,
\   'smart_case': v:true,
\   'auto_complete_delay': 200,
\})
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------
nnoremap <Leader>ws :Ack!<Space>
let g:ack_default_options =" -s -H --nogroup --column --smart-case --follow -m 10"
"let g:ack_autofold_results = 1
"let g:ackpreview = 0
let g:ackhighlight = 1

" ------------------------------------------------
" For Signify see :help Signify
" ------------------------------------------------
let g:signify_disable_by_default=0
nnoremap <leader>st :SignifyToggle<CR>
nnoremap <leader>sd :SignifyDiff<CR>
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
let g:signify_sign_change = '*'

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git']
" mappings to jump to changed blocks
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)

" nicer colors
hi DiffAdd           cterm=bold ctermbg=none ctermfg=2
hi DiffDelete        cterm=none ctermbg=none ctermfg=8
hi DiffChange        cterm=none ctermbg=none ctermfg=25
hi DiffText          cterm=bold ctermbg=none ctermfg=1
hi SignifySignAdd    ctermfg=2
hi SignifySignDelete ctermfg=8
hi SignifySignChange ctermfg=172


hi! PmenuSel        ctermbg=Magenta ctermfg=0 
hi! jediFat         ctermfg=Magenta ctermbg=black

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}


" Yankring -------------------------------

if using_neovim
    let g:yankring_history_dir = '~/.config/nvim/'
    " Fix for yankring and neovim problem when system has non-text things
    " copied in clipboard
    let g:yankring_clipboard_monitor = 0
else
    let g:yankring_history_dir = '~/.vim/dirs/'
endif

" Airline ------------------------------


" ------------------------------------------------
" For airline
" ------------------------------------------------
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

let g:airline_powerline_fonts = 0
let g:airline_theme = 'papercolor'           "papercolor,angr,luna,darcula"
let g:airline#extensions#whitespace#enabled = 0


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
\   'yaml': ['yamllint', 'prettier'],
\}
"let g:ale_linters_ignore = {'python': ['pylint']}
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_fixers = {
\   'python': ['autopep8', 'black', 'isort'],
\   'rust': ['rustfmt'],
\   'javascript': ['eslint'],
\   'yaml': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" let g:ale_set_hightlights = 1
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 0
let g:ale_linters_explicit = 1
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0 "打开quitfix对话框
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --max-line-length=1000 --extend-ignore='
let g:ale_python_black_options = '-l 110'
nmap gk <Plug>(ale_previous_wrap)
nmap gj <Plug>(ale_next_wrap)
nnoremap <leader>at :ALEToggle<CR>
"format代码
nnoremap <leader>af :ALEFix<cr>  


if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else
    let g:webdevicons_enable = 0
endif

" Include user's custom nvim configurations
if using_neovim
    let custom_configs_path = "~/.config/nvim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif
if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ------------------------------------------------
" For themes
" 如果主题等写成前面效果不一致，那就写到最后面吧
" highlight Normal ctermbg=None 可以去除灰层
" higtlight clear SignColumn 可以使得SignColumn颜色主题与使用主题一致
" ------------------------------------------------

" ------------------------------------------------
" For recommand and suggestion
" ------------------------------------------------
" Recommand install neovim
" brew install --HEAD neovim
" ln -s ~/.vim ~/.config/nvim
" ln -s ~/.vimrc ~/.config/nvim/init.vim
" alias vim='nvim'
" 切换输入法, 退出插入模式
set imactivatekey=C-space
inoremap <ESC> <ESC>:set iminsert=2<CR>

"设置iterm透明度,显示背景图片
hi Normal ctermbg=none
