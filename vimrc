filetype off
"Vim-plug
call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-webdevicons'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'patmok/qvim'
Plug 'thaerkh/vim-indentguides'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
call plug#end()

filetype plugin indent on
"set so=999
set termguicolors
set nocompatible
set fileencodings=utf-8
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set visualbell
set laststatus=2
set relativenumber
set number
set nowrap
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme onehalfdark
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
syntax enable
"highlight MatchParen cterm=bold ctermbg=none ctermfg=white
set colorcolumn=120
set ruler
set hidden
set mouse=a
set lazyredraw
set clipboard=unnamedplus
" let g:session_autoload = 'yes'
" let g:session_autosave = 'yes'
" rust
autocmd BufReadPost *.rs setlocal filetype=rust
" Required for operations modifying multiple buffers like rename.
let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly-2017-10-24', 'rls'], }
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F8> :call LanguageClient_textDocument_formatting()<CR>
autocmd BufWritePre *.rs :call LanguageClient_textDocument_formatting()

"set statusline+=%#warningmsg#
"set statusline+=%*

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" map buffer close without losing split window
nmap <C-k> :bp\|bd # <CR>
"airline plugin settings
let g:airline_powerline_fonts = 0
let g:airline_theme = 'onehalfdark'
let g:airline#extensions#tabline#enabled = 0

let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
