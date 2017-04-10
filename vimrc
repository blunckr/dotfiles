call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jceb/vim-orgmode'
Plug 'kchmck/vim-coffee-script'
call plug#end()

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modeline

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

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
set numberwidth=5

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

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" nnoremap <C-h> :bprevious<CR>
" nnoremap <C-l> :bnext<CR>
" nmap <Leader>t :enew<CR>
map <C-o> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = ''
" map <Leader>s :noh<CR>
map <Leader>- :sp<CR>
map <Leader>\| :vsp<CR>
" space w saves
" map <Leader>w :w<CR>

set ignorecase " case insensitive search
set smartcase
set hidden
set hlsearch
" set rnu
set numberwidth=1
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/tmp/**
set wildignore+=**/bower_components/**
set path+=** " poor mans fuzzy find
" prevent auto hard wraps
set fo-=t

" Recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let NERDTreeShowHidden=1

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height=1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_lua_checkers = ['luacheck']
let g:syntastic_scss_scss_checkers = ['scss_lint']
let g:syntastic_html_checkers=['']
let g:syntastic_bash_checkers=['shellcheck']

let g:NERDSpaceDelims = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'ubaryd'
let g:airline_section_y = ''
let g:airline_skip_empty_sections=1
let g:airline#extensions#tabline#buffer_nr_show = 1

set t_Co=256
set background=light

if has('gui_running')
  set guifont=Monospace\ 14
endif
if has('gui_macvim')
  set guifont=Monaco:h16
endif
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
endif
colorscheme solarized

" auto-trim whitespace
autocmd BufWritePre * %s/\s\+$//e
" command Trim :%s/\s\+$// | w
" map <Leader>g :w<cr> !ruby rna_transcription_test<cr>

abbr jlog console.log
autocmd FileType sh setlocal shiftwidth=4 tabstop=4

