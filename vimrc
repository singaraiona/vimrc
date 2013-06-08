set t_Co=256
filetype plugin on
set background=dark
colorscheme fee 

set fileencodings=utf-8                                                         
set nocompatible                                                                
set modelines=0                                                                 
set tabstop=4                                                                   
set shiftwidth=4                                                                
set softtabstop=4                                                               
set visualbell                                                                  
set cursorline                                                                  
set laststatus=2                                                                
set relativenumber                                                              
set guifont=Liberation\ 12
highlight ColorColumn guibg=#8C8C8C
"ctermbg=234
set colorcolumn=80
set ruler
let Tlist_WinWidth = 60

let g:clang_library_path="/usr/lib/llvm/"
let g:clang_snippets = 1                                                        
let g:clang_snippets_engine = 'clang_complete'
let g:clang_complete_copen = 1
let g:session_autoload = 'yes'                                                 
let g:session_autosave = 'yes'

" F6 - previous tab 
nmap <C-F6> :tabprev<cr>
vmap <C-F6> <esc>:tabprev<cr>i
imap <C-F6> <esc>:tabprev<cr>i
" F7 - next tab 
nmap <C-F7> :tabnext<cr>
vmap <C-F7> <esc>:tabnext<cr>i
imap <C-F7> <esc>:tabnext<cr>i

nmap <M-F9> :q!<CR>
nmap <M-F10> :w<CR> 
nmap <M-F11> :wq<CR>
nmap <M-F5> :u<CR>
nmap <M-F6> <C-R><CR>
nnoremap <C-L>  :Tlist <CR>
nmap <C-F11> :tabnew<CR>
imap <C-Space> <C-P>
" Doxygen comment blocks mapping
map <S-H> :DoxyFILEHeader<CR>
map <S-C> :DoxyClass<CR>
map <S-B> :DoxyBlockLong<CR>
map <S-F> :DoxyFunc<CR>
" insert #ifdef FILE_NAME_H in C/C++ header to prevent include twice
map <C-H> :HeaderGatesAdd<CR>
map <C-E> :IfDefCplusPlusAdd<CR>
" function to automatically sets file executable if it's script
function ChMode()
    if getline(1) =~ "^#!"
        if getline(1) =~ "bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction
au BufWritePost * call ChMode()
" history of changes
if version >= 700
    set history=64
    set undolevels=128
    set undodir=/tmp/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
