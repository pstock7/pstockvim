" Vim startup file to detect the 'midas' filetype.
" Author:	Fritz Reese <fritzoreese@gmail.com>
" Version: 1.0
" Date: March 2017
"
" Place this in $VIMHOME/plugin (usually $HOME/.vim/plugin), and
" make sure you have 'filetype plugin on' in your .vimrc. Then the 'midas'
" filetype will automatically be set for Midas macro files ending in .txt.
"

" Auto-detect Midas scripts
au BufNewFile,BufRead *.txt			call s:Check_txt()
func! s:Check_txt()
  let s:lnum = 1
  " Skip leading empty lines and comment lines
  while s:lnum < line("$") && ( getline(s:lnum) =~ "^\s*!.*$"
                            \ || getline(s:lnum) =~ "^\s*$" )
    let s:lnum += 1
  endwhile
  " Load midas plugin if the first real line is 'startmacro'
  if s:lnum < line("$") && ( getline(s:lnum) =~? "^\s*startmacro" )
    set ft=midas
  endif
endfunc

" vim: ts=8 tw=132
