" Load plugins
call plug#begin('~/.vim/plugged')

" Utilities
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'

""" General Functionality
Plug 'lifepillar/vim-mucomplete'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ddollar/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/syntastic/'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-obsession'
Plug 'vim-multiple-cursors'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'christoomey/vim-tmux-navigator'

" Javascript related
Plug 'chemzqm/vim-jsx-improve'

call plug#end()

""""""""""""""""""
" General Settings
""""""""""""""""""
set clipboard=unnamedplus " Uses OS clipboard if enabled
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
" set t_Co=256 "For color terminals with 256 colors support

" Theme Settings
"colorscheme jellybeans
colorscheme base16-atelierlakeside

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Always set autoindenting on
set autoindent "autoindent
set si "Smart indent

" Search related
set ignorecase " Ignore case when searching
set incsearch " Go directly to first result
set smartcase " When searching try to be smart about cases

" one tab 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Linebreak on 500 characters
set lbr
set tw=500


""""""""""""""""""""""
" Custom mapping
""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"" General Mappings (Normal, Visual, Operator-pending)

" <leader> as space
nnoremap <space> <nop>
map <space> <leader>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

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

" CtrlP Settings
nmap <silent> <leader>b :CtrlPBuffer<cr>
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" If windows: let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
if has("win32")
    let g:ctrlp_user_command = 'ag  -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore "**/*.pyc" -g "" %s'
else
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
          \ --ignore .git
          \ --ignore .svn
          \ --ignore .hg
          \ --ignore .DS_Store
          \ --ignore "**/*.pyc"
          \ -g ""'
endif

" Tmux Navigator stuff
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

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

" YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion = 1

" let g:ycm_dont_warn_on_startup = 0

" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1

" let g:ycm_filetype_blacklist = {}

" let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Supertab
" let g:SuperTabDefaultCompletionType    = '<C-n>'
" let g:SuperTabCrMapping                = 0

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
let g:used_javascript_libs = 'react'
let g:AutoPairsFlyMode = 0

"" mucomplete
set completeopt+=menuone
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt+=noselect
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1

" Gui version of Vim (gVim)
set guioptions-=m " Turn off menubar
set guioptions-=T " Turn off toolbar
set guioptions-=r " Turn off right-hand scrollbar
set guioptions-=R " Turn off right-hand scrollbar when split
set guioptions-=L " Turn off left-hand scrollbar
set guioptions-=l " Turn off left-hand=scrollbar when split
set guicursor+=a:blinkon0 " Turn off blinking cursor

" Font settings for gVim
if has("win32")
    set guifont=Consolas:h12
else
    set guifont=Inconsolata\ 11
endif
