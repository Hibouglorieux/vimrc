set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set number
set mouse=a
colo torte
set ruler
set path +=**
set wildmenu
set statusline=%f\ \%m\%=\Line:\ %l\ /\ %L\ -\ Column:\ %v
set foldnestmax=1
set shortmess=a
set omnifunc=omni#cpp#complete#Main
set completefunc=omni#cpp#complete#Main

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"
set switchbuf=usetab,newtab "create new tab when needed
set viminfo='1000,f1
set tags=vimtagfile,~/.vim/tags/cpp
let tagfile='vimtagfile'
set keywordprg=:help
set suffixesadd=.h,.cpp
set complete=.,w,b
" Remaps {{{
let mapleader = " "
" second<CR> is made to quit the cwindow
vnoremap <leader>cp :w !pbcopy<CR>
vnoremap <leader>se "sy/\V<C-r>=escape(@s,'/\')<CR><CR>
nnoremap <leader>se viw"sy/\V<C-r>=escape(@s,'/\')<CR><CR>
vnoremap <leader>re "ry:%s/<C-r>r/
vnoremap <leader>add "ry:%s/\(<C-r>r\)/\1
nnoremap <leader>norm :setlocal colorcolumn=81<CR>
nnoremap <leader>e :Silent !./editor<CR>
nnoremap <leader>vi :e $MYVIMRC<CR>
nnoremap <leader>re :source $MYVIMRC<CR>
nnoremap <leader>source :source $MYVIMRC<CR>
nnoremap <leader>n :tabnew .<CR>
nnoremap <tab> :tabnext<CR>
vnoremap <leader>def "sy:psearch <C-R> s<CR>
nnoremap <leader>def :psearch <C-R><C-W><CR>
nnoremap <S-tab> :tabp<CR>
inoremap jk <esc>
nnoremap <leader>ls :ls<CR>
nnoremap <C-c><C-h> :call Header()<CR>
nnoremap <F1> :call Header()<CR>
nnoremap <leader>class :call Create_class()<CR>
nnoremap <leader>vs :vert split 
nnoremap <leader>vsl :vert botright split 
nnoremap <leader>vsh :vert topleft split 
nnoremap <leader>vsfl :vert bo sfind 
nnoremap <leader>vsfh :vert to sfind 
nnoremap <leader>vsf :vert sfind 
nnoremap <leader>sh :sh<CR>
nnoremap <F12> :ResetMake<CR><CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <F3> :set noh<CR>
nnoremap <leader>head :e %:r.h<CR>
nnoremap <leader>class :e %:r.cpp<CR>
nnoremap <leader>() viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>gita :Silent !git add .<CR>
nnoremap <leader>gitac :silent !git add .<CR>:!git commit -m "
nnoremap <leader>gitc :!git commit -m "
nnoremap <leader>gitp :Redraw !git push<CR>
nnoremap <leader>gf :execute 'find ' . expand('<cword>') . '.cpp'<CR>
nnoremap <leader>gfl :execute 'vert botright sfind ' . expand('<cword>') . '.h'<CR>
nnoremap <leader>gfh :execute 'vert topleft sfind ' . expand('<cword>') . '.h'<CR>
nnoremap <leader>gfvsl :execute 'vert botright sfind ' . expand('<cword>') . '.h'<CR>
nnoremap <leader>gfvsh :execute 'vert topleft sfind ' . expand('<cword>') . '.h'<CR>
nnoremap <leader>gfvs :execute 'vert sfind ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfn :execute 'tabf ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>norme :HighlightExtraSpace<CR>
nnoremap <leader>nnorme :match none ExtraWhitespace<CR> 
nnoremap <leader>open :execute "!open " . expand('%')<CR><CR>
nnoremap <leader>go :execute '!go build ' . expand('%')<CR>
nnoremap <leader><CR> :execute '!' .expand('%:p:r')<CR>
command! -nargs=0 HighlightExtraSpace 
			\ highlight ExtraWhitespace ctermbg=magenta guibg=red'
			\ | match ExtraWhitespace /\s\+$\|  \+\| \t\|\t /
command! -nargs=+ Silent
			\ execute 'silent <args>'
			\ | redraw!
command! -nargs=* Make
			\ silent make <args>
			\ | bo cwindow 5
			\ | redraw!
command! -nargs=* ResetMake
			\ silent exe 'make re'
			\ | bo cw 10
			\ | redraw!
command! -nargs=* Redraw
			\ execute '<args>'
			\ | redraw!
" }}}
" Abbrev {{{
:iabbrev cahr char
:iabbrev itn int
:iabbrev tf ft
:iabbrev carh char
:iabbrev crah char
:iabbrev shotr short
:iabbrev srt str
" }}}

" Header Func {{{
" Small func {{{
"
:function! Get_end_char(i)
if expand('%:e') ==? 'c' || expand('%:e') ==? 'cpp'
	return ' */'
elseif expand('%:e') ==? 'h' || expand('%:e') ==? 'hpp'
	return ' */'
elseif stridx(expand('%'), 'vim') != -1
	if a:i == 0
		return '* "'
	elseif a:i == 10
		return '* "'
	else
		return '  "'
	endif
else
	if a:i == 0
		return '* #'
	elseif a:i == 10
		return '* #'
	else
		return '  #'
	endif
endif
:endf

:function! Get_start_char(i)
if expand('%:e') ==? 'c' || expand('%:e') ==? 'cpp'
	return '/* '
elseif expand('%:e') ==? 'h' || expand('%:e') ==? 'hpp'
	return '/* '
elseif stridx(expand('%'), 'vim') != -1
	if a:i == 0
		return '" *'
	elseif a:i == 10
		return '" *'
	else
		return '"  '
	endif
else
	if a:i == 0
		return '# *'
	elseif a:i == 10
		return '# *'
	else
		return '#  '
	endif
endif
:endf

:function! Space_size_file()
let l:count = len(expand('%:t'))
let l:spaces = ''
let l:max_size = 51
while l:count < l:max_size
	let l:spaces = l:spaces . ' '
	let l:count += 1
endwhile
return l:spaces
:endf

:function! Space_size_name(mail)
let l:count = len($USER) + len(a:mail) + 3
let l:spaces = ''
let l:max_size = 43
while l:count < l:max_size
	let l:spaces = l:spaces . ' '
	let l:count += 1
endwhile
return l:spaces
:endf

:function! Space_size_time_1()
let l:count = len($USER[:8])
let l:spaces = ''
let l:max_size = 18
while l:count < l:max_size
	let l:spaces = l:spaces . ' '
	let l:count += 1
endwhile
return l:spaces
:endf
:function! Space_size_time_2()
let l:count = len($USER[:8])
let l:spaces = ''
let l:max_size = 17
while l:count < l:max_size
	let l:spaces = l:spaces . ' '
	let l:count += 1
endwhile
return l:spaces
:endf

:function! Set_line(begin, ending, i)
let l:mail = $MAIL
if strlen(l:mail) < 5
	let l:mail = "unkown@noaddress.com"
endif
let l:full = '**************************************************************************'
let l:space = '                                                                          '
let l:h3 = '                                                       :::      ::::::::  '
let l:h4 = '  ' . expand('%:t') . Space_size_file() . ':+:      :+:    :+:  '
let l:h5 = '                                                   +:+ +:+         +:+    '
let l:h6 = '  By: ' . $USER[:8] . ' ' . '<' . l:mail[:24] . '>' . Space_size_name(l:mail[:24]) . '+#+  +:+       +#+       ' 
let l:h7 = '                                               +#+#+#+#+#+   +#+          '
let l:h8 = '  Created: ' . strftime("%Y/%m/%d %T ") . 'by ' . $USER[:8] . Space_size_time_1() . '#+#    #+#            '
if a:i == 0
	return a:begin . l:full . a:ending
elseif a:i == 1
	return a:begin . l:space . a:ending
elseif a:i == 2
	return a:begin . l:h3 . a:ending
elseif a:i == 3
	return a:begin . l:h4 . a:ending
elseif a:i == 4
	return a:begin . l:h5 . a:ending
elseif a:i == 5
	return a:begin . l:h6 . a:ending
elseif a:i == 6
	return a:begin . l:h7 . a:ending
elseif a:i == 7
	return a:begin . l:h8 . a:ending
elseif a:i == 8
	call Refresh_date_Header(0)
	return ''
elseif a:i == 9
	return a:begin . l:space . a:ending
elseif a:i == 10
	return a:begin . l:full . a:ending
else
	return ''
endif
:endf

:function! Check_header()
let i = 0
let l:read_file = getbufline(bufname('%'), 0, 11)
while i < 11
	let test = strlen(l:read_file[i])
	if strlen(l:read_file[i]) != 80 
		return (0)
	endif
	if i == 8
		if	stridx(l:read_file[i], 'Updated: ') < 0
			if stridx(l:read_file[i], '###   ########.fr   ') < 0
				return 0
			endif
		endif
	endif
	let i+= 1
endwhile
return 1
:endf

:function! Refresh_file_header()
let l:start_char = Get_start_char(8)
let l:end_char = Get_end_char(8)
let l:line = '  ' . expand('%:t') . Space_size_file() . ':+:      :+:    :+:  '
:4delete
silent call append(3, l:start_char . l:line . l:end_char)
:endf

:function! Refresh_date_Header(i)
if (a:i == 1)
	if (&modified == 0)
		return
	elseif (!(Check_header()))
		return
	endif
endif
let l:pos = getcurpos()
let l:start_char = Get_start_char(8)
let l:end_char = Get_end_char(8)
let l:sentence = '  Updated: ' . strftime("%Y/%m/%d %T ") . 'by ' . $USER . Space_size_time_2(). '###   ########.fr      '
if a:i
	:9delete
endif
silent call append(8, l:start_char . l:sentence . l:end_char)
if a:i
	silent call Refresh_file_header()
	silent call cursor(l:pos[1], l:pos[2])
endif
:endf
"}}}

:function! Header()
if ((Check_header()))
	return
endif
let l:oldpos = getcurpos()
let l:lines = 12
let i = 0
while (i < l:lines)
	let l:start_char = Get_start_char(i)
	let l:end_char = Get_end_char(i)
	let l:full_line = Set_line(l:start_char, l:end_char, i)
	if i != 8
		call append(i, l:full_line)
	endif
	let i = i + 1
endwhile
silent call cursor(l:oldpos[1] + 12, l:oldpos[2])
:endf
" }}}
" {{{ cpp class
:function! Create_class()
let name = expand('<cword>:h')
call append(line('$'), '#ifndef ' . toupper(name) . '_CLASS_H')
call append(line('$'), '# define ' . toupper(name) . '_CLASS_H')
call append(line('$'), '')
call append(line('$'), 'class ' . name . ' {')
call append(line('$'), 'public:')
call append(line('$'), "\t" . name . '(void);')
call append(line('$'), "\t~" . name . '(void);')
call append(line('$'), 'private:')
call append(line('$'), '};')
call append(line('$'), '')
call append(line('$'), '#endif')
:endf
" }}}
" Php func {{{
:function! Php_func()
call append(0, "<?PHP")
call append(1, "")
call append(2, "?>")
:endf
" }}}

" Ctags func {{{
function! CtagsExit(cwd, job_id, exit_code)
    if a:exit_code == 0
        call rename(a:cwd . '/newtags', a:cwd . '/.tags')
        echo "Ctags finished with 0"
    else
        echo "Ctags finished with " . a:exit_code . " (execute :messages to see output)"
    endif
endfunction

function! CtagsOutput(channel, data)
    echomsg a:data
endfunction

function! CtagsStartup()
    let cmdline='/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -o vimtagfile'
    let options = {
                \   'in_io': "null",
                \   'out_cb': "CtagsOutput",
                \   'err_cb': "CtagsOutput",
                \   'exit_cb': function('CtagsExit', [ getcwd() ])
                \ }
    call job_start(cmdline, options)
endfunction

function! HandleWinEnter()
    if &previewwindow
        setlocal syntax=cpp
    endif
endfunction
" Autocmd {{{
augroup path_files
    au! BufRead *
                \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
                \ exec "set path+=".s:tempPath
augroup END
augroup php_files
	au! BufNewFile *php :call Php_func()
	au! BufWrite *php execute "!chmod 755 " . expand('%') . ' &'
	au! FileType *php setlocal foldmethod=indent
augroup END
augroup c_files
	au!
    au BufRead,BufNewFile *.c setl filetype=c
    au BufRead,BufNewFile *.cpp,*.h,*.hpp,*.tpp setl filetype=cpp
    au BufRead,BufNewFile *.cpp,*.h,*.hpp,*.tpp setl syntax=cpp
	au FileType c,cpp,cpp11,go setlocal foldmethod=syntax
augroup END
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup ctags
    autocmd!
    autocmd VimEnter * call CtagsStartup()
    autocmd VimLeave * set modifiable | call delete(tagfile)
augroup END
augroup previewWindow
    autocmd!
    autocmd WinEnter * call HandleWinEnter()
augroup END
""
"function! MatchAllWord()
"    let Word_To_highlight = expand('<cword>')
"    let OldWord
"    execute "match" . " Special " . "/" . Word_To_highlight . "/"
"    call match Special 
""
""augroup highlightWord
"    autocmd!
"    autocmd CursorMoved *.c,*.cpp,*.h call MatchAllWord()
""augroup END
"augroup headers
"	autocmd!
"	:autocmd BufNewFile *.c,*.*pp :call Header()
"	:autocmd BufWritePre *.c,*.*pp,*.h :silent call Refresh_date_Header(1)
"augroup END
" }}}
" vimrc ecole
" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    vimrc                                              :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: zaz <zaz@staff.42.fr>                      +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2013/06/15 12:45:34 by zaz               #+#    #+#              "
"    Updated: 2013/06/24 11:03:24 by zaz              ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"Do not edit this file
"Put your own configuration options in ~/.myvimrc

"Activate indentation
filetype off
filetype plugin indent on
set smartindent

"Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4
set expandtab

"Disable vi-compatibility
set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

"Prevent backups when editing system files
au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /private/etc/pw.* set nowritebackup

"Source user configuration
if filereadable(expand("~/.myvimrc"))
	source ~/.myvimrc
endif
