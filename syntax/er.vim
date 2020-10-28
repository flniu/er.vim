" Vim syntax file
" Language: ER
" Filename: *.er
" Author: Francis Niu (https://github.com/flniu)


if exists("b:current_syntax")
  finish
endif

syn case match

" Operator
syn match    erOperator '[{}:,]'

" Comments
syn keyword  erTodo contained TODO FIXME XXX
syn match    erComment '^\s*#.*$' contains=erTodo
syn match    erComment '\s\zs#\s.*$' contains=erTodo

" Quoted
syn region   erString start=+`+ skip=+\\\\\|\\`+ end=+`+
syn region   erString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region   erString start=+"+ skip=+\\\\\|\\"+ end=+"+

" General keywords
syn keyword  erDirective entity title header relationship
syn keyword  erOption label color bgcolor size font border-color border

" ER identifiers
syn match    erEntity '\[[^]]\+\]'
syn match    erPrimaryKey '^\s*\zs\*[^{]\+'
syn match    erForeignKey '^\s*\zs+[^{]\+'
syn match    erPrimaryKeyForeignKey '^\s*\zs\*+[^{]\+'
syn match    erPrimaryKeyForeignKey '^\s*\zs+\*[^{]\+'
syn match    erLine '[?1*+]--[?1*+]'
syn match    erRelationship '^\s*\zs[^{]\+[?1*+]--[?1*+][^{]\+' contains=erLine


" Highlight links
hi link erOperator              Operator

hi link erTodo                  Todo
hi link erComment               Comment

hi link erString                String

hi link erDirective             Keyword
hi link erOption                Type

hi link erEntity                Identifier
hi def  erPrimaryKey            term=underline cterm=underline gui=underline
hi def  erForeignKey            term=italic cterm=italic gui=italic ctermfg=11 guifg=#A6E22E
hi def  erPrimaryKeyForeignKey  term=underline,italic cterm=underline,italic gui=underline,italic ctermfg=11 guifg=#A6E22E
hi link erLine                  Operator
hi link erRelationship          Identifier


let b:current_syntax = 'er'
" vim:et:ts=2:sw=2:fdm=marker:
