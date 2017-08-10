"
" If on a new system, run this first:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" After this, run :PlugInstall to install all the plugins.

"
" Load plugins
"


call plug#begin('~/.vim/plugged')

" Utilities
" Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'ddollar/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ervandew/supertab'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/syntastic/'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-obsession'
" Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/matchit'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tlib_vim'
Plug 'moll/vim-node'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'

" Javascript Related Plugins & Settings
" Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent' " replaces vim-javascript
" Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim' " replaces vim-javascript-syntax
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'
Plug 'ludovicchabant/vim-gutentags'
Plug 'othree/jspc.vim'
Plug 'leafgarland/typescript-vim'
Plug 'quramy/tsuquyomi'

" React realted plugins & settings
Plug 'mxw/vim-jsx'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Processing
Plug 'sophacles/vim-processing'

call plug#end()

""""""""""""""""""
" General Settings
""""""""""""""""""
set clipboard=unnamed " Uses OS clipboard if enabled
set nocompatible " not compatible with vi

set autoread " Set to auto read when a file is changed from the outside
set history=1000 " change history to 1000

"""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""
set wildmenu " enhanced command line completion
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set title " set terminal title:w
set showmatch " show matchin braces
set cmdheight=1 " command bar height

"""""""""""""""""""""""
" Visual and  Color Scheme Settings
"""""""""""""""""""""""
set guifont=Monaco:h12
set nowrap
set relativenumber
set number
set laststatus=2
set ttimeoutlen=50
set lazyredraw
set ttyfast " faster redrawing
set mouse=r
set ttymouse=xterm2
syntax enable
set t_Co=256

" Theme Settings
" colorscheme base16-default-dark

let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark

let g:airline_powerline_fonts = 1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Always set autoindenting on
set autoindent

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Go directly to first result
set incsearch

" When searching try to be smart about cases
set smartcase

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

""""""""""""""""""""""
" Custom mapping
""""""""""""""""""""""
" Emmet expand on tab in insert mode
imap <C-Y> (emmet-expand-abbr)

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" <leader> as space
nnoremap <space> <nop>
map <space> <leader>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>


" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" NERDCommenter mappings
map <leader>; <plug>NERDCommenterToggle<CR>

" Nerdtree toggle with <leader>f
map <leader>f :NERDTreeToggle<CR> :NERDTreeMirror<CR>
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$']

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader><tab> <c-^>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" CtrlP Settings
nmap <silent> <leader>b :CtrlPBuffer<cr>
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" Tmux Navigator stuff
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
" nnoremap <silent> {C-\} :TmuxNavigatePrevious<cr>


" Opening a new tab
nnoremap <leader>t :tabnew<cr>

" Change tabs using <leader>+h, <leader>+l
nnoremap <leader>h :tabp<cr>
nnoremap <leader>l :tabn<cr>

match ErrorMsg '\s\+$'
nnoremap <leader>rtw :%s/\s\+$//e<CR>

"""""""""""""""""""""""""""""""""
" Autocomplete related settings "
"""""""""""""""""""""""""""""""""

" Ultisnips

let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

nnoremap <leader>ue :UltiSnipsEdit<cr>

" YouCompletEMe
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_dont_warn_on_startup = 0

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_filetype_blacklist = {}

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" Easy Motion
map <leader>w <Plug>(easymotion-w)

" Backups
set backup                     " enable creation of backup files
set backupdir=~/.vim/backups   " Where to store the backups
set directory=~/.vim/tmp       " Temporary files will go

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"""""""""""""""""""""""
" Javascript Settings "
"""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['standard']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


" Javascript Libs settins
let g:used_javascript_libs = 'angularjs,jquery,react'

let g:AutoPairsFlyMode = 0

"""""""""""""""""
" Openframeworks
"""""""""""""""""
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_openframeworks.py"
