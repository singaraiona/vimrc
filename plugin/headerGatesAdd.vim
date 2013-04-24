"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" File Name:      headerGatesAdd.vim
" Abstract:       A (G)VIM plugin which automatic insert C/C++ header gates .
" Author:         帅得不敢出门  email:tczengming@163.com
" Version:        1.4
" Last Change:    2012.12.10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage {{{
"   When create a new c/c++ header this plugin will automatic insert c/c++ header gates.
"       we also could manual insert gates by inputing command :HeaderGatesAdd
" }}}

" Example {{{
" ----------------------------------------
" let g:HeaderGatesAdd_extern_c=1
" #ifdef __cplusplus
" extern "C" {
" #endif
"
"
" #ifdef __cplusplus
" }
" #endif
" ----------------------------------------
"
"-----------------------------------------
" let g:HeaderGatesAdd_gate_type=0
" aTestFile.h ---> A_TEST_FILE
" ----------------------------------------
"
"-----------------------------------------
" let g:HeaderGatesAdd_gate_type=1
" aTestFile.h ---> ATESTFILE
" ----------------------------------------
"
"-----------------------------------------
" let g:HeaderGatesAdd_gate_type=2
" aTestFile.h ---> aTestFile
" ----------------------------------------
"
"-----------------------------------------
" let g:HeaderGatesAdd_suffix="_H"
" add suffix A_TEST_FILE --> A_TEST_FILE_H
" ----------------------------------------
"
"-----------------------------------------
" let g:HeaderGatesAdd_prefix="PREFIX_"
" add suffix A_TEST_FILE_SUFFIX --> PREFIX_A_TEST_FILE_SUFFIX
" ----------------------------------------
" }}}


" Avoid reloading {{{

if exists('loaded_cinsert_header_gates')
    finish
endif

let loaded_cinsert_header_gates= 1

if !exists('g:HeaderGatesAdd_extern_c')
    let g:HeaderGatesAdd_extern_c=0
endif

if !exists('g:HeaderGatesAdd_prefix')
    let g:HeaderGatesAdd_prefix=""
endif

if !exists('g:HeaderGatesAdd_suffix')
    let g:HeaderGatesAdd_suffix="_H"
endif

if !exists('g:HeaderGatesAdd_gate_type')
    let g:HeaderGatesAdd_gate_type=0
endif

function! s:GenerateGateStr()
    let s:name = expand("%:t:r")

    " insert prefix
    let s:gate = g:HeaderGatesAdd_prefix

    let s:n = len(s:name)
    let s:i = 0
    while s:i < s:n
        " process space and '.'
        if s:name[s:i] == " " || s:name[s:i] == "\."
            let s:gate = s:gate . "_"
            let s:i += 1
            continue
        endif

        if g:HeaderGatesAdd_gate_type == "0"  " default  aTestFile.h ---> A_TEST_FILE
            if s:name[s:i] =~ '\u'
                let s:gate = s:gate . "_" . s:name[s:i]
            else
                let s:gate = s:gate . toupper(s:name[s:i])
            endif
        elseif g:HeaderGatesAdd_gate_type == "1"    " aTestFile.h  ---->  ATESTFILE
            let s:gate = s:gate . toupper(s:name[s:i])
        else   " aTestFile.h  ----> aTestFile
            let s:gate = s:gate . s:name[s:i]
        endif

        let s:i = s:i + 1
    endwhile

    " append suffix
    let s:gate = s:gate . g:HeaderGatesAdd_suffix

    return s:gate
    unset s:name
    unset s:n
    unset s:i
    unset s:gate
endfunction

"insert header gates
function! s:InsertHeaderGates()
    let s:title = expand("%:t")
    " Test for empty filename.
    if empty(s:title)
        echoerr "Empty filename (save file and try again)."
        return
    endif
    let s:gate = <SID>GenerateGateStr()
    let s:n = 0
    call append(s:n, ["#ifndef " . s:gate,
                \     "#define " . s:gate,
                \     ""])
    let s:n += 4
    let s:n = line("$")
    call append(s:n, ["#endif" . "  /*" . s:gate . "*/" ])
endfunction

" insert ifdef __cplusplus
function s:IfdefCplusPlus()
    let s:n = line(".")
    call append(s:n, [ "#ifdef __cplusplus",
                    \      "extern \"C\" {",
                    \      "#endif",
                    \      "" ])
    let s:n = line("$")
    call append(s:n, ["#ifdef __cplusplus",
                    \      "}",
                    \      "#endif" ])
endfunction
command! -nargs=0 HeaderGatesAdd : call <SID>InsertHeaderGates()
command! -nargs=0 IfDefCplusPlusAdd : call <SID>IfdefCplusPlus()

autocmd BufNewFile *.{h} call <SID>InsertHeaderGates()
