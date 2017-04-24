filetype off
"Vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'aperezdc/vim-template'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'w0ng/vim-hybrid'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'yggdroot/indentline'
Plugin 'gregsexton/gitv'
Plugin 'kshenoy/vim-signature'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'neomake/neomake'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'pbogut/fzf-mru.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'Shougo/unite.vim'
Plugin 'frankier/neovim-colors-solarized-truecolor-only'
call vundle#end()

filetype plugin indent on

set so=999
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
set background=dark
"colorscheme hybrid
colorscheme solarized
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
syntax enable
"highlight MatchParen cterm=bold ctermbg=none ctermfg=white
set colorcolumn=120
set ruler
set hidden
"let g:session_autoload = 'yes'
"let g:session_autosave = 'yes'

"cycling buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-L> :NERDTreeToggle<CR>

" autoformat plugin
au BufWrite * :Autoformat
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1

" rust
let g:rustfmt_autosave = 0
let g:racer_cmd = "/home/singa/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" map buffer close without losing split window
nmap <C-k> :bp\|bd # <CR>
inoremap <C-Space> <C-x><C-o>
"airline plugin settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

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
"webdevicons plugin
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '*'
let g:DevIconsEnableFoldersOpenClose = 1
let g:templates_directory = expand('~/.vim/templates')

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:SuperTabContextDefaultCompletionType = "<c-x><c-p>"
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"

let g:indentLine_char = '┆'

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
let pymode_lint_unmodified = 1
set mouse=a
"runtime! ftplugin/man.vim
set lazyredraw
"" Neomake
let g:neomake_echo_current_error=1
let g:neomake_verbose=1
autocmd! BufWritePost *.rs Neomake
