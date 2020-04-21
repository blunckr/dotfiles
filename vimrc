" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jceb/vim-orgmode'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

filetype plugin indent on " enable plugins for specific file types
packadd! matchit " extended matching with %

let mapleader = " "

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

set backspace=2   " Backspace deletes like most programs in insert mode
set backupdir=~/.vim/tmp//,. " keep backup files out of local dir
set directory=~/.vim/tmp//,. " keep swap files out of local dir
set history=2000  " command history
set tabpagemax=50 " limit max tabs opened by -p or :tab
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set modeline      " read modelines from files
set autoindent    " preserve indent level in files without indent plugin
set complete-=i   " don't scan files for autocomplete. uneeded and slow
set complete+=kspell " use dictionary for completion when spellcheck is on
set smarttab      " <BS> deletes one tab width
set nrformats-=octal " <C-a>,<C-x> doesn't effect octal (leading 0s)
set mouse=nvi     " don't enable mouse in command, as an override option

" don't wait forever on commands if another command shares the prefix
set ttimeout
set ttimeoutlen=100

set display+=lastline " don't replace long lines with @@ when not wrapping
set autoread      " read file again if it has changed

set hlsearch      " highlight search results
" clear highlights
map <Leader>h :noh<CR>

set scrolloff=3     " Context lines above and below cursor
set sidescrolloff=5 " Context lines left and right of cursor, nowrap only

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" Shift-Tab inserts a real Tab character
inoremap <S-Tab> <C-V><Tab>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·,precedes:«,extends:»
let &showbreak="\u21aa "
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
set ignorecase " case insensitive search
set smartcase " adding a capital letter makes it case sensitive
set hidden " leave a file with unwritten changes
set wildmenu

set formatoptions-=t " prevent auto hard wraps
set formatoptions+=j " Delete comment character when joining commented lines

" for gitgutter to update more quickly
set updatetime=100

set termguicolors
colorscheme base16-irblack

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" let g:ale_completion_enabled = 1

" let g:vifm_term = 'xfce4-terminal -e='

let g:fzf_layout = { 'down': '~30%' }

if has('gui_running')
"   let $FZF_DEFAULT_COMMAND = 'rg --files'
  set guifont=Hack\ Regular\ 16
"   set guicursor+=a:blinkon0
"   let g:dracula_colorterm = 1
"   set background=dark
"   " let g:vifm_embed_term = 1
endif

" time whitespace
command! Trim :%s/\s\+$//e
command! Gblame :execute("!tig blame % +") . line(".")

" map <Leader>g :w<cr> !ruby rna_transcription_test<cr>
map <Leader>l :w \| !love .<CR>
map <C-p> :Files<CR>
map <leader>p :Buffers<CR>
map <leader>f :ALEFix<CR>
map <leader>s :setlocal spell!<CR>

" map <Leader>h <C-w>h
" map <Leader>j <C-w>j
" map <Leader>k <C-w>k
" map <Leader>l <C-w>l

map <Leader>g :!tig status<CR>
map <Leader>c :!git commit -v<CR>
map <Leader>i :setlocal foldmethod=indent<CR>
map <Leader>t :term<CR>

abbr jlog console.log
abbr epry require IEx; IEx.pry
abbr rpry require 'pry'; binding.pry
abbr eecho >&2 echo
abbr pdb import pdb; pdb.set_trace()
" decamelize
let @c = "0f_x~@c"
let @p = "iputs 'vvvvvvvv'puts '^^^^^^^^'€ýaOpp "

" 4 spaces for shell scripts
autocmd FileType sh setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal noexpandtab nolist
autocmd FileType make setlocal noexpandtab nolist
autocmd FileType plaintex setlocal textwidth=70
