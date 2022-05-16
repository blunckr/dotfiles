call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iberianpig/tig-explorer.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'yggdroot/indentLine'
call plug#end()

filetype plugin indent on " enable plugins for specific file types

let mapleader = " "

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

set backspace=2   " Backspace deletes like most programs in insert mode

set nobackup
set nowritebackup
set noswapfile

set undofile
set undodir=/tmp

set number
set history=2000  " command history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set modeline      " read modelines from files
set smarttab      " <BS> deletes one tab width
set nrformats-=octal " <C-a>,<C-x> doesn't effect octal (leading 0s)
set mouse=nvi     " don't enable mouse in command, as an override option
" set clipboard=unnamedplus                              " use system clipboard by default

" don't wait forever on commands if another command shares the prefix
" set ttimeout
" set ttimeoutlen=100

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
set list listchars=tab:»·,trail:·,nbsp:·
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

"set t_Co=256

set background=light
set term=xterm-256color
set termguicolors
let base16colorspace=256
colorscheme base16-flat

set grepprg=rg\ --vimgrep " use rg as default grepper

" time whitespace
command! Trim :%s/\s\+$//e
command! Jq %!jq .
command! Format :call CocActionAsync('format')
command! Import :call CocAction('runCommand', 'editor.action.organizeImport')
command! Config :ed ~/.vimrc

nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Buffers<CR>
nnoremap <leader>f :call CocActionAsync('format')<CR>
nnoremap <leader>i :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <leader>s :setlocal spell!<CR>
nnoremap <Leader>g :TigStatus<CR>
nnoremap <Leader>c :!git commit -v<CR>
nnoremap <leader>d :call CocAction('jumpDefinition')<CR>

let g:coc_node_path = '/usr/bin/node'
nmap <leader>rn <Plug>(coc-rename)
abbr jlog console.log
abbr epry require IEx; IEx.pry
abbr rpry require 'pry'; binding.pry
abbr eecho >&2 echo
abbr pdb import pdb; pdb.set_trace()
" decamelize
let @c = "0f_x~@c"
let @p = "iputs 'vvvvvvvv'puts '^^^^^^^^'€ýaOpp "

" 4 spaces for shell scripts
" autocmd FileType sh setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal noexpandtab nolist
autocmd FileType make setlocal noexpandtab nolist
autocmd FileType plaintex setlocal textwidth=70
