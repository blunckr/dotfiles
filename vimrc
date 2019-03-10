" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
" Plug 'bling/vim-airline'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()
" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=200
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modeline
set nohlsearch
" set clipboard=unnamedplus
" set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
" set numberwidth=1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
" C-h is backspace, so this makes sense
inoremap <C-l> <del>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

set ignorecase " case insensitive search
set smartcase " adding a capital letter makes it case sensitive
set hidden " leave a file with unwritten changes
" set hlsearch " highlight all matching searches
" set rnu " relative line numbers
set wildmenu
" set wildignore+=**/node_modules/**
" set wildignore+=**/tmp/**
" set wildignore+=**/bower_components/**
" set wildignore+=**/deps/**
" set wildignore+=**/_build/**
set path+=** " poor mans fuzzy find
" prevent auto hard wraps
set fo-=t

let NERDTreeShowHidden=1

let g:NERDSpaceDelims = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" number buffers
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_y = '' " encoding
let g:airline_skip_empty_sections=1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#ale#enabled = 0

set t_Co=256
let g:dracula_italic = 0
let g:dracula_colorterm = 0
" color dracula
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark
" allows transparency
highlight Normal ctermbg=None
" highlight ALEWarning ctermbg=Red
" let g:ale_echo_cursor = 1
" let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1

let g:vifm_term = 'xfce4-terminal -x'
let g:vifm_exec_args = ''

let g:fzf_layout = { 'down': '~30%' }

" for gitgutter to update more quickly
set updatetime=100

if has('gui_running')
  let $FZF_DEFAULT_COMMAND = 'rg --files'
  set guifont=xos4\ Terminus\ Regular\ 14
  set guicursor+=a:blinkon0
  let g:dracula_colorterm = 1
  set background=dark
endif
if has('gui_macvim')
  set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h16
  " Don't show pop-ups when files change etc.
  set guioptions+=c
endif
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
endif

" time whitespace
command! Trim :%s/\s\+$//e

" map <Leader>g :w<cr> !ruby rna_transcription_test<cr>
map <Leader>l :w \| !love .<CR>
" clear highlights
map <Leader>h :noh<CR>
map <C-p> :Files<CR>
map <leader>p :Buffers<CR>
map <leader>f :ALEFix<CR>

map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

abbr jlog console.log
abbr epry require IEx; IEx.pry
abbr rpry require 'pry'; binding.pry
" decamelize
let @c = "0f_x~@c"

" 4 spaces for shell scripts
autocmd FileType sh setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal noexpandtab nolist

