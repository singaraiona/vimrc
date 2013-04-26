"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" File Name:      interpreterHeader.vim
" Abstract:       A (G)VIM plugin which automatic insert interpreter string.
" Author:         Anton Kundenko email:volonter84@gmail.com
" Version:        1.0
" Last Change:    2013.04.26

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.{sh} call append(0, ["#!/bin/bash"])
autocmd BufNewFile *.{py} call append(0, ["#!/usr/bin/env python"])
autocmd BufNewFile *.{pl} call append(0, ["#!/usr/bin/env perl"])
autocmd BufNewFile *.{rb} call append(0, ["#!/usr/bin/env ruby"])
 

