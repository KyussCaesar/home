" vimrc by antony.

execute pathogen#infect()

" Reminder of what some of your plugins do:
"
" Abolish:
"
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
"
" :%Subvert/facilit{y,ies}/building{,s}/g
"
" crm       MixedCase
" crc       camelCase
" crs       snake_case
" cru       UPPER_CASE
" cr-       dash-case
" cr.       dot.case
" cr<space> space case
" crt       Title Case
"
" fugitive: git stuff
" gitgutter: show changes in working tree in sidebar
"
" surround:
"
" ys{text object}{thing to surround with}
" cs{old surrounding}{new surrounding}
" ds{surrounding}

filetype plugin indent on
syntax on

" Use Vim as man-pager
runtime! ftplugin/man.vim
let g:ft_man_open_mode = 'tab'
set keywordprg=:Man

" this has fucked me up too many times.
inoremap zE zR
nnoremap zE zR

" navigation and keybindings
" {       

" navigate tabs
nnoremap <F2> :tabp<CR>
nnoremap <F3> :tabn<CR>
vnoremap <F2> <ESC>:tabp<CR>
vnoremap <F3> <ESC>:tabn<CR>

" hardwrap the whole file
nnoremap <Leader>F gggqG

" scrolling
nnoremap H 3<C-Y>
nnoremap L 3<C-E>

map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <C-w>h
inoremap <C-j> <C-w>j
inoremap <C-k> <C-w>k
inoremap <C-l> <C-w>l

" navigate from terminal windows
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" quicker leave visual mode
vnoremap i <ESC>i

" nagivate wrapped lines properly
nnoremap j gj
nnoremap k gk

" Mappings for writing HTML
" these mostly just auto-complete a tag
function HtmlBindings()
    " generally-speaking, it's <Leader>X for <X>, and <Leader><Leader>X for
    " </X>

	" paragraph
	inoremap <buffer> <Leader>p <p>
	inoremap <buffer> <Leader><Leader>p </p>

	" headings
	inoremap <buffer> <Leader>h <h
	inoremap <buffer> <Leader><Leader>h </h>

	" section
	inoremap <buffer> <Leader>s <section>
	inoremap <buffer> <Leader><Leader>s </section>

	" class
	inoremap <buffer> <Leader>c <BS>class="

	" italics, bold, underline
	inoremap <buffer> <Leader>i <em>
	inoremap <buffer> <Leader><Leader>i </em>
	inoremap <buffer> <Leader>b <strong>
	inoremap <buffer> <Leader><Leader>b </strong>
	inoremap <buffer> <Leader>u <underline>
	inoremap <buffer> <Leader><Leader>u </underline>
endfunction


function XMLBindings()
    inoremap <buffer> <Leader> <
    inoremap <buffer> <Leader><Leader> >
    inoremap <buffer> <Leader><Leader><Leader> </
endfunction


function ProseBindings()

    setlocal dictionary+=/usr/share/dict/words

    " correct last misspelling from insert/normal mode
    inoremap <buffer> <Leader>S <Esc>[s1z=A
    nnoremap <buffer> <Leader>S [s1z=

    " grammar options
    command! Grammar GrammarousCheck
    nnoremap <buffer> ]g <Plug>(grammarous-move-to-next-error)
    nnoremap <buffer> [g <Plug>(grammarous-move-to-previous-error)

    nnoremap <C-S-K> :Vimwiki2HTML<CR>

    " setlocal formatoptions=ant
    setlocal textwidth=80
    setlocal noautoindent
    setlocal nocindent
    setlocal nosmartindent
    setlocal spell
endfunction

" }

" folding
" {

set foldmethod=marker 
set foldmarker={,}
set foldcolumn=4
set foldopen-=block

nnoremap <space> za

" end folding }

" various settings (tabstop, wrapping, statusline)
" {

set wildmode=longest,list,full
set wildmenu

set number

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

set virtualedit=all

set scrolloff=12

set nowrap
set linebreak
set showbreak=>

set ruler
set title
set showmode

set backspace=indent,eol,start

set display+=lastline

set mouse=a

set smartcase

" Statusline
set laststatus=2
set statusline=
set statusline+=%y
set statusline+=\ %f
set statusline+=%=
set statusline+=\ l%l/%L\ c%c
set statusline+=\ %p%%

set cursorline
set colorcolumn=80

" Spell checking
set spelllang=en_nz

" end various settings }

" highlighting functions
" {
" Functions to execute highlighting for various filetypes.

" Default highlighting stuff
function DoHighlights()
	highlight clear
	highlight Normal ctermfg=White
	highlight SpecialKey ctermfg=DarkGray
	highlight NonText ctermfg=DarkGray
	highlight CursorLine cterm=bold
	highlight CursorLineNr ctermfg=White cterm=underline,bold
	highlight LineNr ctermfg=Gray
	highlight Folded ctermfg=DarkCyan ctermbg=Black
	highlight FoldColumn ctermfg=DarkCyan ctermbg=Black
  highlight PreProc ctermfg=DarkGray
	highlight MatchParen cterm=underline,bold ctermfg=Magenta ctermbg=LightMagenta
	highlight vimComment ctermfg=Gray

  " git gutter
  highlight SignColumn ctermbg=Black
  highlight GitGutterAdd ctermfg=Green
  highlight GitGutterDelete ctermfg=Red
  highlight GitGutterChange ctermfg=Yellow

    " C
	highlight cComment ctermfg=DarkGray
	highlight cConstant ctermfg=Magenta
	highlight cType ctermfg=Blue
	highlight cInclude ctermfg=DarkGray
	highlight cIncluded ctermfg=Green
	highlight cPreProc ctermfg=Gray
	highlight cDefine ctermfg=Gray
	highlight cString ctermfg=DarkGreen
	highlight cStatement cterm=bold ctermfg=Red

    " Rust
	highlight rustKeyword ctermfg=Red
	highlight rustString ctermfg=DarkGreen
	highlight rustCommentLine ctermfg=DarkGray
	highlight rustCommentBloc ctermfg=DarkGray
	highlight rustStorage ctermfg=Magenta
	highlight rustConditional ctermfg=Yellow
	highlight rustRepeat ctermfg=Yellow
	highlight rustUnsafeKeyword ctermfg=Red
	highlight rustFuncName ctermfg=White
	highlight rustMacro ctermfg=LightGray
	highlight rustAttribute ctermfg=LightGreen
	highlight rustDerive ctermfg=LightGreen
	highlight rustDeriveTrait ctermfg=LightGreen
	highlight rustOperator ctermfg=White
	highlight rustSelf ctermfg=LightBlue
	highlight rustType ctermfg=Blue
	highlight rustTypedef ctermfg=Blue
	highlight rustStructure ctermfg=Blue
	highlight rustModPath ctermfg=White
	highlight rustFuncCall ctermfg=White
	highlight rustTrait ctermfg=Yellow
	highlight rustPanic ctermfg=Red

    " Python
	highlight pythonFunction ctermfg=Blue
	highlight pythonBuiltin ctermfg=Yellow
	highlight pythonInclude ctermfg=Brown
	highlight pythonComment ctermfg=Gray
	highlight pythonString ctermfg=DarkGreen
	highlight pythonQuotes ctermfg=Green cterm=bold
	highlight pythonStatement cterm=bold ctermfg=Red

    " HTML
	highlight htmlTag ctermfg=DarkGrey
	highlight htmlEndTag ctermfg=DarkGrey
	highlight htmlTagName ctermfg=LightBlue
	highlight htmlString ctermfg=Green
	highlight htmlArg ctermfg=Blue
	highlight htmlComment ctermfg=Grey

  " Spellck
  highlight SpellBad cterm=bold ctermfg=Red ctermbg=Black
  highlight SpellCap ctermfg=White ctermbg=Black
  highlight SpellRare ctermfg=White ctermbg=Black
  highlight SpellLocal ctermfg=White ctermbg=Black

endfunction

" end highlighting }

" autocmds
" {

autocmd VimEnter * call DoHighlights()
autocmd BufEnter *.html call HtmlBindings()
autocmd BufEnter makefile :setlocal noexpandtab
autocmd BufEnter Makefile :setlocal noexpandtab
autocmd BufEnter *.md call ProseBindings()
autocmd BufEnter *.tex call ProseBindings()
autocmd BufEnter *.latex call ProseBindings()
autocmd BufEnter *.wiki call ProseBindings()
autocmd BufEnter nginx.conf setfiletype nginx 

function ForceTabStop()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction

" turn off underscore to arrow conversion and set tabstop
function UnFuckR()
  call ForceTabStop()
  let R_assign=2
endfunction

function UnFuckPython()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

" Force tabstop to my preferred values
" Sometimes it gets overidden by filetype plugins
autocmd BufEnter * call ForceTabStop()
autocmd BufEnter *.R call UnFuckR()
autocmd BufEnter *.py call UnFuckPython()

" end autocmds }

" other functions
" {

function CppOpen(argument)
    execute "tabedit " . a:argument . ".h"
    vs %<.cpp
endfunction
command -nargs=1 -complete=file CppOpen :call CppOpen(<f-args>)

command Vimrc execute ":edit ~/.vimrc"
command Bashrc execute ":edit ~/.bashrc"

function Author()
  normal Aauthor: Antony Southworth <antony.southworth@quantiful.co.nz>
  normal gcc
endfunction

function Created()
  read! date +'\%Y-\%m-\%d'
  normal ICreated: 
  normal gcc
endfunction

function AuthorCreated()
  call Author()
  call Created()
endfunction

" end random functions }

