"Picolisp filetype 
au BufNewFile,BufRead *.l         setf picolisp | set lisp 
"Rust filetype
au BufNewFile,BufRead *.rs        setf rust 
" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.k		setfiletype k
  au! BufRead,BufNewFile *.q		setfiletype q
  au! BufRead,BufNewFile *.s		setfiletype sql
  au! BufRead,BufNewFile *.o		setfiletype q
augroup END
