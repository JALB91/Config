"  _   _ ________  ________ _____ 
" | | | |_   _|  \/  | ___ /  __ \
" | | | | | | | .  . | |_/ | /  \/
" | | | | | | | |\/| |    /| |    
" \ \_/ /_| |_| |  | | |\ \| \__/\
"(_\___/ \___/\_|  |_\_| \_|\____/

""""""""""""""""""""" OS specific variables
if has("win32")
    let s:os = "win"
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            let s:os = "mac"
        else
            let s:os = "unix"
        endif
    endif
endif

""""""""""""""""""""" Download and install plug-vim and all plugins
if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
endif

""""""""""""""""""""" Create and sets undo dir
if !isdirectory($HOME . "/.vim/undodir")
  call mkdir($HOME . "/.vim/undodir", "p")
endif

set undofile                        " Save undo's after file closes
set undodir=$HOME/.vim/undodir//    " where to save undo histories
set undolevels=1000                 " How many undos
set undoreload=10000                " number of lines to save for undo

""""""""""""""""""""" Create and sets swap dir
if !isdirectory($HOME . "/.vim/swapdir")
  call mkdir($HOME . "/.vim/swapdir", "p")
endif

set directory=$HOME/.vim/swapdir//

""""""""""""""""""""" Create and sets backup dir
if !isdirectory($HOME . "/.vim/backupdir")
  call mkdir($HOME . "/.vim/backupdir", "p")
endif

set backupdir=$HOME/.vim/backupdir//
set backup

""""""""""""""""""""" Aesthetic settings
set showcmd         " Show (partial) command in status line.
set number          " Show line numbers.
set relativenumber  " Show relative line numbers.
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.

""""""""""""""""""""" Fonts
if s:os == "unix"
    if has('gui_running')
        set guifont=Fira\ Code\ Regular:h14
        set guioptions-=m  "remove menu bar
        set guioptions-=T  "remove toolbar
    else
        set guifont=Fira\ Code\ Regular:h14
    endif
elseif s:os == "mac"
    set guifont=Fira\ Code\ Retina:h14
    if has('gui_running')
        set macligatures
    endif
elseif s:os == "win"
    set guifont=Fira\ Code\ Regular:h14
endif

""""""""""""""""""""" Highlight
syntax on           " Syntax Highlight
set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
match Delimiter /\d\ze\%(\d\d\%(\d\{3}\)*\)\>/

""""""""""""""""""""" Search
set hlsearch        " When there is a previous search pattern, don't highlight all
                    " its matches.
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set ignorecase      " Ignore case in search patterns.
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.

""""""""""""""""""""""""""""""""" Utils
set bs=indent,eol,start         " Allow backspacing over everything in insert mode
set scrolloff=5                 " Keep at least 5 lines above/below
set sidescrolloff=5             " Keep at least 5 lines left/right 
set mouse=a                     " Enable mouse
set hidden                      " Can hide not saved buffers
set autoread                    " Auto update file when it's changed from outside.
set wildmenu                    " Auto completion command bar
set wildmode=longest:full,full  "
"set clipboard=unnamed           "

"""""""""""""""""""" Indent settings
set ai              " Always set autoindenting on
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set cindent         "
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set softtabstop=0   "
set expandtab       " Converts tab to spaces
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set smarttab        "
set wrap            " Disable automatic return line
set textwidth=0     "
set wrapmargin=0    "

""""""""""""""""""""""""" Encoding fixes
set encoding=utf8       "
set fileencoding=utf-8  "
set termencoding=utf-8  "
set ffs=unix,dos,mac    "

""""""""""""""""""""""""" Code folding settings
set foldenable          " Enable folding
set foldlevelstart=99   " Open all folds by default
set foldmethod=indent   " Fold based on indent level

"______ _     _   _ _____ _____ _   _ _____ 
"| ___ | |   | | | |  __ |_   _| \ | /  ___|
"| |_/ | |   | | | | |  \/ | | |  \| \ `--. 
"|  __/| |   | | | | | __  | | | . ` |`--. \
"| |   | |___| |_| | |_\ \_| |_| |\  /\__/ /
"\_|   \_____/\___/ \____/\___/\_| \_\____/ 

""""""""""""""""""""""""""""""""""""""""" vim-plug
call plug#begin('~/.vim/plugged')       "
"""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-eunuch'                 " Vim sugar for the UNIX shell commands
Plug 'majutsushi/tagbar'                " Tagbar: a class outline viewer for Vim
Plug 'lilydjwg/colorizer'               " A Vim plugin to colorize all text in the form #rrggbb or #rgb
Plug 'scrooloose/nerdcommenter'         " Vim plugin for intensely orgasmic commenting 
Plug 'nathanaelkane/vim-indent-guides'  " A Vim plugin for visually displaying indent levels in code
Plug 'jiangmiao/auto-pairs'             " Insert or delete brackets, parens, quotes in pair
Plug 'jeetsukumaran/vim-buffergator'    " Vim plugin to list, select and switch between buffers
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc finder
Plug 'rking/ag.vim'                     " This plugin is a front for ag, A.K.A. the_silver_searcher
Plug 'can3p/incbool.vim'                " The plugin allows to increment not only numbers but also and bools 
Plug 'kshenoy/vim-signature'            " Plugin to toggle, display and navigate marks 
Plug 'undofile_warn.vim'                " Warn old undo
Plug 'tpope/vim-fugitive'               " A Git wrapper so awesome, it should be illegal
Plug 'lifepillar/vim-mucomplete'        " Chained completion that works the way you want!
Plug 'Shougo/vimfiler.vim' | Plug 'Shougo/unite.vim' " Powerful file explorer implemented by Vim script
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' " lean & mean status/tabline for vim that's light as air
"""""""""""""""""""""""""""""""""""""""""
Plug 'nanotech/jellybeans.vim'          "
Plug 'morhetz/gruvbox'                  "
"""""""""""""""""""""""""""""""""""""""""
call plug#end()                         "
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""" Autopairs
let g:AutoPairsFlyMode = 0                   "
let g:AutoPairsShortcutBackInsert = '<M-b>'  "

""""""""""""""""""""" Filetype
filetype plugin on  " Attempts to detect the filetype
filetype indent on  " Detects default indent settings for this language

""""""""""""""""""""""""""""""""" NERD Commenter
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left

""""""""""""""""""""""""""""""""""""""""""""""""" Indent Guides
let g:indent_guides_guide_size = 1              "
let g:indent_guides_enable_on_vim_startup = 1   "
let g:indent_guides_start_level = 2             "

""""""""""""""""""""""""""""""""""""""""""""" vimfiler
let g:vimfiler_as_default_explorer = 1      "
let g:vimfiler_safe_mode_by_default = 0     "
let g:vimfiler_ignore_pattern = ""          " Show hidden files
let g:vimfiler_tree_opened_icon = '▾'       "
let g:vimfiler_tree_closed_icon = '▸'       "
let g:vimfiler_readonly_file_icon = '✗'     "
let g:vimfiler_marked_file_icon = '✓'       "

"""""""""""""""""""""""""""""""""""""""""""""""""" vim-airline
set laststatus=2                                 " Airline statusbar always up
let g:airline_powerline_fonts = 1                " Cooler git fonts
let g:airline#extensions#tabline#enabled = 1     " Smarter tab line
let g:airline#extensions#tabline#fnamemod = ':t' " Show the filename

""""""""""""""""""""""""""""""""""""""""""""" Buffergator
let g:buffergator_suppress_keymaps = 1

""""""""""""""""""""""""""""""""""""""" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
if s:os == "win"
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|o|bin|dll|class|png|jpg|jpeg|gif)$',
  \ 'link': '',
  \}

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

""""""""""""""""""""""""""""""""""""" Ag settings
set runtimepath^=~/.vim/bundle/ag

""""""""""""""""""""""""""""""""""""" mucomplete settings
let g:mucomplete#enable_auto_at_startup = 0

""""""""""""""""""""""""""""" Colour settings
set t_Co=256                "
colorscheme gruvbox
set background=dark

"___  ___ ___ ____________ _____ _   _ _____ _____ 
"|  \/  |/ _ \| ___ | ___ |_   _| \ | |  __ /  ___|
"| .  . / /_\ | |_/ | |_/ / | | |  \| | |  \\ `--. 
"| |\/| |  _  |  __/|  __/  | | | . ` | | __ `--. \
"| |  | | | | | |   | |    _| |_| |\  | |_\ /\__/ /
"\_|  |_\_| |_\_|   \_|    \___/\_| \_/\____\____/ 

""""""""""""""""" Map Leader
let mapleader = "-"
""""""""""""""""" Compatibility mappings
set <M-b>=b
""""""""""""""""" Visual mode
inoremap jk <ESC>
""""""""""""""""" Clears the search highlights
nmap <silent> <leader><space> :noh<CR>
""""""""""""""""" Add comments on the left
nmap // <leader>cl
vmap // <leader>cl
""""""""""""""""" Toggle comments
nmap ?? <leader>ci
vmap ?? <leader>ci
""""""""""""""""" Vimfiler explorer window
nnoremap <F2> :VimFiler<CR>
""""""""""""""""" Buffergator toggle
nnoremap <F3> :BuffergatorToggle<CR>
""""""""""""""""" Toggle paste mode
set pastetoggle=<F4>
""""""""""""""""" Tagbar tab
nnoremap <F9> :TagbarToggle<CR>
""""""""""""""""" Search the word under cursor using Ag
nnoremap <F12> :Ag <cword><CR>
""""""""""""""""" Next/prev buffers
nmap <leader>[ :bprevious<CR>
nmap <leader>] :bnext<CR>
""""""""""""""""" Close buffer
nmap <leader>][ :bp <BAR> bd #<cr>
""""""""""""""""" Alternative bindings for function keys
nmap <leader>2 <F2>
nmap <leader>3 <F3>
nmap <leader>4 <F4>
nmap <leader>9 <F9>
nmap <leader>12 <F12>
""""""""""""""""" Save with sudo privileges
cnoremap w! SudoWrite
""""""""""""""""" Move vertically over fake lines
nnoremap j gj
nnoremap k gk
""""""""""""""""" Yank to EOL like it should
map Y y$
""""""""""""""""" Stamp over a word
nnoremap S "_diwP
""""""""""""""""" Paste without overwriting
xnoremap p "_dP
""""""""""""""""" Misc
nnoremap QQ :q!<cr>

"______ _   _ _   _ _____ _____ _____ _____ _   _ _____ 
"|  ___| | | | \ | /  __ |_   _|_   _|  _  | \ | /  ___|
"| |_  | | | |  \| | /  \/ | |   | | | | | |  \| \ `--. 
"|  _| | | | | . ` | |     | |   | | | | | | . ` |`--. \
"| |   | |_| | |\  | \__/\ | |  _| |_\ \_/ | |\  /\__/ /
"\_|    \___/\_| \_/\____/ \_/  \___/ \___/\_| \_\____/ 

"""""""""""""""""""""""""" Insert #define guards in new header files
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
