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
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()
" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=200
" set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modeline
set hlsearch
set scrolloff=3   " Context lines above and below cursor
" let &t_ut='' " this fixes the background in kitty somehow

filetype plugin indent on

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
" set number

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
" Shift-Tab inserts a real Tab character
inoremap <S-Tab> <C-V><Tab>

" C-h is backspace, so this makes sense
inoremap <C-l> <del>

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
" set splitright

" Always use vertical diffs
set diffopt+=vertical

set ignorecase " case insensitive search
set smartcase " adding a capital letter makes it case sensitive
set hidden " leave a file with unwritten changes
set wildmenu
" prevent auto hard wraps
set fo-=t

" let g:jellybeans_overrides = {
" \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
" \}
" if has('termguicolors') && &termguicolors
"     let g:jellybeans_overrides['background']['guibg'] = 'none'
" endif
colorscheme base16-default-dark
" set t_Co=256
" let base16colorspace=256
set termguicolors
" allows transparency
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" let g:ale_completion_enabled = 1

" let g:vifm_term = 'xfce4-terminal -e='

let g:fzf_layout = { 'down': '~30%' }

" for gitgutter to update more quickly
set updatetime=100

if has('gui_running')
  let $FZF_DEFAULT_COMMAND = 'rg --files'
  " set guifont=xos4\ Terminus\ Regular\ 14
  set guicursor+=a:blinkon0
  let g:dracula_colorterm = 1
  set background=dark
  " let g:vifm_embed_term = 1
endif

" time whitespace
command! Trim :%s/\s\+$//e
command! Gblame :execute("!tig blame % +") . line(".")

" map <Leader>g :w<cr> !ruby rna_transcription_test<cr>
map <Leader>l :w \| !love .<CR>
" clear highlights
map <Leader>s :noh<CR>
map <C-p> :Files<CR>
map <leader>p :Buffers<CR>
map <leader>f :ALEFix<CR>

map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

map <Leader>g :!tig status<CR>
map <Leader>c :!git commit -v<CR>
map <Leader>i :setlocal foldmethod=indent<CR>
map <Leader>t :term<CR>

abbr jlog console.log
abbr epry require IEx; IEx.pry
abbr rpry require 'pry'; binding.pry
abbr eecho >&2 echo
" decamelize
let @c = "0f_x~@c"
let @p = "iputs 'vvvvvvvv'puts '^^^^^^^^'��aOpp "

" 4 spaces for shell scripts
autocmd FileType sh setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal noexpandtab nolist
autocmd FileType make setlocal noexpandtab nolist

