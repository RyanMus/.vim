" Fisa-vim-config, a config for both Vim and NeoVim
" http://vim.fisadev.com
" version: 12.0.1

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal 
" (if you aren't using one of those fonts, you will see funny characters here. 
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 0


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
Plug 'roxma/vim-hug-neovim-rpc'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
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
" Window chooser
Plug 't9md/vim-choosewin'
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
Plug 'neomake/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'
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

    " syntax highlight on
    syntax on
    let mapleader = ","
    let g:mapleader = ","
    inoremap  <c-i>         <esc>2l
    noremap  <c-j>          <c-w>j
    noremap  <c-k>          <c-w>k
    noremap  <c-h>          <c-w>h
    noremap  <c-l>          <c-w>l
    noremap  <leader>w      :w<CR>
    vnoremap  <leader>al    :EasyAlign ** \|<CR>
    vnoremap  <leader>a=    :EasyAlign ** =<CR>
    vnoremap  <leader>y     "+y
    noremap  <leader>p      <esc>"+p
    inoremap  <leader>p     <esc>"+p
    noremap  <leader>!      :w !sudo tee "%"<CR>
    noremap  <leader>q      :q<CR>
    noremap  <leader>i      :IndentLinesToggle<CR>
    noremap  <leader>e      :MRU<CR>
    nnoremap <leader>u      :GundoToggle<CR>
    noremap  <leader>tp     :set paste!<CR>
    noremap  <leader>x     :TaskList<cr>
    noremap  <leader>z     :RainbowParenthesesToggle<cr>
    noremap  <leader>b     <c-o><c-o>
    noremap =               <c-w>15+
    noremap -               <c-w>15-
    noremap <leader>>       <c-w>15>
    noremap <leader><       <c-w>15<
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
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" show line numbers
set nu
set autoread                     " Set to auto read when a file is changed from the outside
set autowrite                    " Set to auto write when a file is changed from the outside
set autochdir                    "Auto change the global dir of the current windows

"{{{ for easymotion move fast 
    "noremap  / <Plug>(easymotion-sn)
    "onoremap / <Plug>(easymotion-tn)
    noremap  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)
    nmap w <Plug>(easymotion-w)
    nmap b <Plug>(easymotion-b)
    "noremap s <Plug>(easymotion-sn)
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

"{{{Gundo设置
    let g:gundo_width = 30
    let g:gundo_preview_height = 30
    let g:gundo_right = 0
    let g:gundo_help = 0
"}}}

" remove ugly vertical lines on window division
set fillchars+=vert:\ 


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
"au VimEnter * RainbowParenthesesToggle
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

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" tab navigation mappings
map tt :tabnew 

" when scrolling, keep cursor 10 lines away from screen border
set scrolloff=10

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd FileType markdown  noremap <leader>mp MarkdownPreview<cr> 
autocmd! bufwritepost *vimrc source $HOME/.vimrc

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

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
autocmd Filetype python  iabb todo # TODO 
"autocmd FileType python,php setlocal foldmethod=indent foldlevel=99 
autocmd FileType c,cpp,java,perl,sh setlocal foldmethod=marker foldmarker={,} foldlevel=99 formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://

" Run linter on write
autocmd! BufWritePost * Neomake
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

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
" commands finder mapping
nmap ,c :Commands<CR>

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

" mappings
noremap ,s :Ack 
nmap ,ws :execute ":Ack " . expand('<cword>')<CR>

" Window Chooser ------------------------------

" mapping
nmap <c-w>  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git']
" mappings to jump to changed blocks
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)

let g:neomake_warning_sign = {
 \   'text': '~',
 \   'texthl': 'NeomakeWarningSign',
 \ }

" nicer colors
hi DiffAdd           cterm=bold ctermbg=none ctermfg=cyan
hi DiffDelete        cterm=bold ctermbg=none ctermfg=1
hi DiffChange        cterm=bold ctermbg=none ctermfg=4
hi SignifySignAdd    cterm=bold ctermbg=237  ctermfg=7
hi SignifySignDelete cterm=bold ctermbg=237  ctermfg=7
hi SignifySignChange cterm=bold ctermbg=237  ctermfg=7
hi! NeomakeErrorSignDefault   ctermfg=red ctermbg=none
hi! NeomakeWarningSign ctermfg=cyan ctermbg=none

hi! Pmenu           ctermbg=7 ctermfg=0  
hi! PmenuSel        ctermbg=Magenta ctermfg=0 
"hi search           ctermfg=black ctermbg=green 
hi! PmenuSbar       ctermbg=Magenta ctermfg=7
hi! PmenuThumb      ctermbg=Magenta ctermfg=7


hi! jediFat ctermfg=Magenta  ctermbg=black
"hi TabLineSel     ctermfg=7 cterm=NONE
"hi! TabLine        ctermfg=7 cterm=reverse ctermbg=none
"hi! ToolbarLine   ctermfg=Magenta ctermbg=none
"hi! ToolbarFill   cterm=none term=none
"hi! SignColumn    cterm=bold ctermfg=Magenta ctermbg=none



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

let g:airline_powerline_fonts = 0
let g:airline_theme = 'luna'           " angr, molokai, wombat, luna ,darcula"
let g:airline#extensions#whitespace#enabled = 0

" Fancy Symbols!!

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

" Custom configurations ----------------

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
