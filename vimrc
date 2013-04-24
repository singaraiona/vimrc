set t_Co=256
set nocp
filetype plugin on
colorscheme molokai 
set guifont=Terminus\ 12
set number
highlight ColorColumn guibg=#151825 ctermbg=234
set colorcolumn=80

let g:clang_library_path="/usr/lib/llvm/"
let g:clang_snippets = 1                                                        
let g:clang_snippets_engine = 'clang_complete'
let g:clang_complete_copen = 1
" F6 - previous buffer
nmap <C-F6> :tabprev<cr>
vmap <C-F6> <esc>:tabprev<cr>i
imap <C-F6> <esc>:tabprev<cr>i

" F7 - next buffer
nmap <C-F7> :tabnext<cr>
vmap <C-F7> <esc>:tabnext<cr>i
imap <C-F7> <esc>:tabnext<cr>i

set tabstop=4
set shiftwidth=4
set smarttab
set et
set ai

nmap <M-F9> :q!<CR>
nmap <M-F10> :w<CR> 
nmap <M-F11> :wq<CR>
nmap <M-F5> :u<CR>
nmap <M-F6> <C-R><CR>
nnoremap <C-L>  :Tlist <CR>
nmap <M-F7> :make <CR>
"nmap <F7>   :make clean && make <CR> 
nmap <C-F11> :tabnew<CR>
imap <C-Space> <C-P>
" Doxygen comment blocks mapping
map <S-H> :DoxyFILEHeader<CR>
map <S-C> :DoxyClass<CR>
map <S-B> :DoxyBlockLong<CR>
map <S-F> :DoxyFunc<CR>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
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
