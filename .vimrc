" Load plugins
call plug#begin('~/.vim/plugged')

" Utilities
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'

""" General Functionality

"Plug 'lifepillar/vim-mucomplete'
"Plug 'honza/vim-snippets'
"Plug 'scrooloose/syntastic'
Plug 'chiel92/vim-autoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ddollar/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dyng/ctrlsf.vim'
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'tpope/vim-obsession'
Plug 'vim-multiple-cursors'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
"Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
"Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'as': 'dracula' }

""" Interface related
Plug 'itchyny/lightline.vim'

""" Git related
" Plug 'tpope/vim-fugitive'

" Javascript and HTML related
"Plug 'chemzqm/vim-jsx-improve'
Plug 'mattn/emmet-vim'
"Plug 'w0rp/ale'

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
set nowrap
set relativenumber
set number
set laststatus=2
set ttimeoutlen=50
set lazyredraw
set ttyfast " faster redrawing
set mouse=r
set ttymouse=xterm2

" Theme Settings
syntax on
set t_Co=256 "For color terminals with 256 colors support
set termguicolors
let g:dracula_italic = 0
let g:colors_name = 'dracula'
color dracula
highlight Normal ctermbg=NONE

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
" Custom mapping & disabled mapping
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

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader><tab> <c-^>

" Ctrl+P for FZF
nmap <c-p> :FZF<cr>

"""""""""""""""""
" Plug Settings "
"""""""""""""""""

map <leader>f :NERDTreeToggle<CR> :NERDTreeMirror<CR>
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$']

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

nnoremap <leader>ue :UltiSnipsEdit<cr>


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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--config C:\Users\Hristo.D.Dimitrov\nvm\v6.9.5\node_modules\ut-tools\eslint\.eslintrc'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" Ale options
let g:ale_javascript_eslint_options = '--config C:\Users\Hristo.D.Dimitrov\nvm\v6.9.5\node_modules\ut-tools\eslint\.eslintrc'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

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
