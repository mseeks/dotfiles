execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = " "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'zenorocha/dracula-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'jaxbot/github-issues.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'thoughtbot/vim-rspec'
Bundle 'ervandew/supertab'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set noswapfile
syntax on
set expandtab
set smarttab
set shiftwidth=2
set number
set hidden
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Github config
let g:github_access_token = [PASSWORD]
let g:gissues_lazy_load = 0
let g:gissues_async_omni = 0

set backspace=indent,eol,start

" Always show status bar
set laststatus=2

" WOO COLORS
colors Tomorrow-Night-Eighties

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Remove trailing whitespace automagically
autocmd BufWritePre * :%s/\s\+$//e

" Easymotion config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>r :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Quick write
nmap ww :w<CR>
imap ww <Esc>:w<CR>i
vmap ww <Esc>:w<CR>

" Quick write and quit
nmap wq :wq<CR>
imap wq <Esc>:wq<CR>
vmap wq <Esc>:wq<CR>

" Quick quit
nmap qq :q<CR>
imap qq <Esc>:q<CR>
vmap qq <Esc>:q<CR>

" Quick force quit
nmap qqq :q!<CR>
imap qqq <Esc>:q!<CR>
vmap qqq <Esc>:q!<CR>

" Quick normal mode
imap yy <Esc>
vmap yy <Esc>

" Quick insert mode
nmap ii i
vmap ii <Esc>i

" Quick visual mode
nmap vv v
imap vv <Esc>v

" Quick visual-line mode
nmap vvv V
imap vvv <Esc>V

" Quick undo
nmap uu u
imap uu <Esc>ui
vmap uu <Esc>u

" Git shortcuts
function! PushToCurrentBranch()
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  exe ":Gpush origin " . branch
endfunction

function! PullFromCurrentBranch()
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  exe ":Gpull origin " . branch
endfunction

nmap <Leader>ga :Git add .<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit -am ""<left>
nmap <Leader>gp :call PushToCurrentBranch()<CR>
nmap <Leader>gl :call PullFromCurrentBranch()<CR>
nmap <Leader>gf :Git fetch origin<CR>
nmap <Leader>gg :vsplit<CR><c-l>:Git! status -s<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gt :Git log --oneline --graph --color --all --decorate<CR>

" Github shortcuts
nmap <Leader>gi :Gissues<CR>
nmap <Leader>gn :Giadd<CR>
nmap <Leader>gm :Gmiles<CR>

" Move focus to window facing h
nmap <silent> <C-h> :wincmd h<CR>
imap <silent> <C-h> :wincmd h<CR>
vmap <silent> <C-h> :wincmd h<CR>
""Move focus to window facing j
nmap <silent> <C-j> :wincmd j<CR>
imap <silent> <C-j> :wincmd j<CR>
vmap <silent> <C-j> :wincmd j<CR>
"Move focus to window facing k
nmap <silent> <C-k> :wincmd k<CR>
imap <silent> <C-k> :wincmd k<CR>
vmap <silent> <C-k> :wincmd k<CR>
"Move focus to window facing l
nmap <silent> <C-l> :wincmd l<CR>
imap <silent> <C-l> :wincmd l<CR>
vmap <silent> <C-l> :wincmd l<CR>
"Move focus to previous window
nmap <silent> <C-p> :wincmd p<CR>
imap <silent> <C-p> :wincmd p<CR>
vmap <silent> <C-p> :wincmd p<CR>

" Toggle tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" CtrlP Tags search
nnoremap <leader>. :CtrlPTag<cr>

" Tag autocomplete
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Snipmate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails,ruby-1.9'

