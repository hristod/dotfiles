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
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'ddollar/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'ervandew/supertab'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/syntastic/'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/matchit'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tlib_vim'
Plug 'moll/vim-node'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
" Plug 'SirVer/ultisnips'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'skammer/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'

" Javascript Related Plugins
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'

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
set ttyfast " faster redrawing
set mouse=a

" colorscheme Spacegray
set t_Co=256
syntax enable

" Solarised Theme Settings

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

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

" 1 tab == 2 spaces
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

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Toggle hlsearch with <leader>hs
" nmap <leader>hs :set hlsearch! hlsearch?<CR>

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


" Rainbow Parantheses
let g:rainbow#max_level = 8
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" let g:rainbow#blacklist = [255, 234]

let g:rainbow#colors = {
\   'dark': [
\     ['yellow',  'orange1'     ],
\     ['green',   'yellow1'     ],
\     ['cyan',    'greenyellow' ],
\     ['magenta', 'green1'      ],
\     ['red',     'springgreen1'],
\     ['yellow',  'cyan1'       ],
\     ['green',   'slateblue1'  ],
\     ['cyan',    'magenta1'    ],
\     ['magenta', 'purple1'     ]
\   ],
\   'light': [
\     ['darkyellow',  'orangered3'    ],
\     ['darkgreen',   'orange2'       ],
\     ['blue',        'yellow3'       ],
\     ['darkmagenta', 'olivedrab4'    ],
\     ['red',         'green4'        ],
\     ['darkyellow',  'paleturquoise3'],
\     ['darkgreen',   'deepskyblue4'  ],
\     ['blue',        'darkslateblue' ],
\     ['darkmagenta', 'darkviolet'    ]
\   ]
\ }

" Check file syntax on open:
