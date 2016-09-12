set t_Co=256
set term=xterm-256color
set nocompatible
filetype off
"Vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'klen/python-mode'
Plugin 'tell-k/vim-autopep8'
Plugin 'ervandew/screen'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'racer-rust/vim-racer'
Plugin 'aperezdc/vim-template'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Raimondi/delimitMate'
call vundle#end()

filetype plugin indent on

set fileencodings=utf-6
"set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set visualbell
"set cursorline
"set guicursor+=n-v-c:blinkon0
set laststatus=2
set relativenumber
set number
set guifont=Terminus\ 12
set linespace=3
set nowrap
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T
set guioptions-=m
"colorscheme jellybeans
colorscheme molokai

highlight ColorColumn ctermbg=235 guibg=#E6E6E6
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
inoremap <C-@> <C-x><C-o>
let g:ScreenShellGnuScreenVerticalSupport = 'native'
"airline plugin settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"bdevicons plugin
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
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rs'] = '*'
let g:templates_directory = expand('~/.vim/templates')

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('q', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('python', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('rs', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('sh', 'Magenta', 'none', '#ff00ff', '#151515')

:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
let pymode_lint_unmodified = 1
set mouse=a
runtime! ftplugin/man.vim

