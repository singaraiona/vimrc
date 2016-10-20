set t_Co=256
set term=xterm-256color
set nocompatible
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
"Plugin 'klen/python-mode'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'aperezdc/vim-template'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'w0ng/vim-hybrid'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'yggdroot/indentline'
Plugin 'gregsexton/gitv'
Plugin 'kshenoy/vim-signature'
Plugin 'scrooloose/syntastic'
Plugin 'racer-rust/vim-racer'
Plugin 'timonv/vim-cargo'
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on

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
"set guifont=Anonymice\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 12
"set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 10
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 10
"set linespace=3
set nowrap
set background=dark
set termguicolors
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
syntax enable
colorscheme hybrid
highlight MatchParen cterm=bold ctermbg=none ctermfg=white
set colorcolumn=120
set ruler
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

"cycling buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nmap <M-F9> :q!<CR>
nmap <M-F10> :w<CR>
nmap <M-F11> :wq<CR>
nmap <M-F5> :u<CR>
nmap <M-F6> <C-R><CR>
nmap <C-x> :shell<CR>
nnoremap <C-L>  :NERDTreeToggle<CR>
nnoremap <C-J>  :ScreenShell<CR>
nnoremap <C-K>  :ScreenQuit<CR>
" function to automatically sets file executable if it's script
function ChMode()
    if getline(1) =~ "^#!"
        if getline(1) =~ "bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction
au BufWritePost * call ChMode()

" autoformat plugin
au BufWrite * :Autoformat
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1

" rust
let g:rustfmt_autosave = 0

" history of changes
if version >= 700
    set history=64
    set undolevels=128
    set undodir=/tmp/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

function s:SetProjectDir(dir)
    exe 'silent' 'cd' a:dir
    :silent cscope add cscope.out
    :silent set tags+=tags
    redraw!
endfunction

:command! -nargs=1 -complete=dir Spdir call s:SetProjectDir(<f-args>)

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" map buffer close without losing split window
nmap <C-k> :bp\|bd # <CR>
inoremap <C-Space> <C-x><C-o>
"airline plugin settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']
let g:syntastic_rust_checkers = ['rustc', '-Zno-trans']

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
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rs'] = '*'
let g:templates_directory = expand('~/.vim/templates')

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:indentLine_char = '┆'

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
let pymode_lint_unmodified = 1
set mouse=a
runtime! ftplugin/man.vim
" Temporary bindings for Rust developing:
nmap <F9> :!cargo run <CR>
nmap <F10> :RustFmt <CR>
