" Colors
colorscheme badwolf

" Enable Syntax
syntax enable

" Tabulations
set tabstop=4           " Number of spaces per TAB
set softtabstop=4       " Number of spaces in tab when editing
set expandtab           " Tabs are space

" UI Config
set number              " Show line numbers
set showcmd             " Show command in bottom bar
set cursorline          " Highlight current line
filetype indent on      " Load filetype-specific indent files
set wildmenu            " Visual autocompletion for command menu
set lazyredraw          " Redraw only when we need to
set showmatch           " Highlight matching [({})]

" Searching & Highlights
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches
                        " Shortcut to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable          " Enable folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za     " Spaces toggle folds
set foldmethod=indent   " Fold based on indent level

" Movement
nnoremap j gj           " Move vertically by visual line
nnoremap k gk           "
nnoremap B ^            " Move to beginning/end of line
nnoremap E $            "
nnoremap $ <nop>        " Desactive $ ^ keys
nnoremap ^ <nop>        "
nnoremap gV `[v`]       " Highlight last inserted text

" Leader shortcuts
let mapleader=","       " Leader key is COMMA <,>
inoremap jk <esc>       " Replace <esc> key per j+k
nnoremap <leader>u :GundoToggle<CR>
                        " Toggle GundoVim, the < Undo Tree >

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Launch Config
call pathogen#infect()  " Use pathogen
call pathogen#runtime_append_all_bundles()

" Autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Backups saved in /tmp folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


