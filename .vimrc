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
set switchbuf=usetab,newtab "create new tab when needed
" Remaps {{{
let mapleader = " "
nnoremap <leader>m :Make<CR>
" second<CR> is made to quit the cwindow
vnoremap <leader>cp :w !pbcopy<CR>
vnoremap <leader>se "sy/\V<C-r>=escape(@s,'/\')<CR><CR>
vnoremap <leader>re "ry:%s/<C-r>r/
vnoremap <leader>add "ry:%s/\(<C-r>r\)/\1
nnoremap <leader>. :Silent !./doom-nukem<CR>
nnoremap <leader>norm :setlocal colorcolumn=81<CR>
nnoremap <leader>e :Silent !./editor<CR>
nnoremap <leader>vi :e $MYVIMRC<CR>
nnoremap <leader>re :source $MYVIMRC<CR>
nnoremap <leader>source :source $MYVIMRC<CR>
nnoremap <leader>n :tabnew .<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabp<CR>
nnoremap <F3> :noh<CR>
inoremap jk <esc>
nnoremap <C-c><C-h> :call Header()<CR>
nnoremap <F1> :call Header()<CR>
nnoremap <leader>Class :call Create_class()<CR>
nnoremap <leader>class :e %:r.cpp<CR>
nnoremap <leader>head :e %:r.hpp<CR>
nnoremap <leader>vs :vert split 
nnoremap <leader>vsl :vert botright split 
nnoremap <leader>vsh :vert topleft split 
nnoremap <leader>vsfl :vert bo sfind 
nnoremap <leader>vsfh :vert to sfind 
nnoremap <leader>vsf :vert sfind 
nnoremap <leader>sh :sh<CR>
nnoremap <F12> :ResetMake<CR><CR>
nnoremap <leader>php :execute '!./' . expand("%")<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader>() viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>gita :Silent !git add .<CR>
nnoremap <leader>gitac :silent !git add .<CR>:!git commit -m "
nnoremap <leader>gitc :!git commit -m "
nnoremap <leader>gitp :Redraw !git push<CR>
nnoremap <leader>gf :execute 'find ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfl :execute 'vert botright sfind ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfh :execute 'vert topleft sfind ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfvsl :execute 'vert botright sfind ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfvsh :execute 'vert topleft sfind ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfvs :execute 'vert sfind ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>gfn :execute 'tabf ' . expand('<cword>') . '.c'<CR>
nnoremap <leader>norme :HighlightExtraSpace<CR>
nnoremap <leader>nnorme :match none ExtraWhitespace<CR> 
nnoremap <leader>open :execute "!open " . expand('%')<CR><CR>
nnoremap <leader>go :execute '!go build ' . expand('%')<CR>
nnoremap <leader><CR> :execute '!' .expand('%:p:r')<CR>
command! -nargs=0 HighlightExtraSpace 
			\ highlight ExtraWhitespace ctermbg=magenta guibg=red
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
elseif expand('%:e') ==? 'h' || expand('%:e') ==? 'hpp' || expand('%:e') ==? 'tpp'
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
elseif expand('%:e') ==? 'h' || expand('%:e') ==? 'hpp' || expand('%:e') ==? 'tpp'
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
	let l:mail = "nallani@42.fr"
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
let l:line = line("w0")
let l:pos = getcurpos()
let l:start_char = Get_start_char(8)
let l:end_char = Get_end_char(8)
let l:sentence = '  Updated: ' . strftime("%Y/%m/%d %T ") . 'by ' . $USER . Space_size_time_2(). '###   ########.fr      '
if a:i
	:let @x=@"
	:9delete
endif
silent call append(8, l:start_char . l:sentence . l:end_char)
if a:i
	silent call Refresh_file_header()
	:execute "normal ". l:line . 'z'
	silent call cursor(l:pos[1], l:pos[2])
	:let @"=@x
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

" Autocmd {{{
augroup php_files
	au! BufNewFile *php :call Php_func()
	au! BufWrite *php execute "!chmod 755 " . expand('%') . ' &'
	au! FileType *php setlocal foldmethod=indent
augroup END
augroup c_files
	au!
	au BufNewFile,BufRead ,*.tpp setlocal filetype=cpp
	au FileType c setlocal foldmethod=syntax
	au FileType cpp setlocal foldmethod=syntax
	au Filetype go setlocal foldmethod=syntax
augroup END
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup headers
	autocmd!
	:autocmd BufNewFile *.c,*.*pp :call Header()
	:autocmd BufWritePre *.c,*.*pp,*.h :silent call Refresh_date_Header(1)
augroup END
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
set noexpandtab

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
