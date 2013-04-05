" ==============================================================================
" File: smooth_scroll.vim
" Author: Terry Ma
" Description: Scroll the screen smoothly to retain better context. Useful for
" replacing Vim's default scrolling behavior with CTRL-D, CTRL-U, CTRL-B, and
" CTRL-F
" Last Modified: April 04, 2013
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

" ==============================================================================
" Global Functions
" ==============================================================================

" Scroll the screen up
function! smooth_scroll#up(dist, duration, speed)
  call s:smooth_scroll('u', a:dist, a:duration, a:speed)
endfunction

" Scroll the screen down
function! smooth_scroll#down(dist, duration, speed)
  call s:smooth_scroll('d', a:dist, a:duration, a:speed)
endfunction

" ==============================================================================
" Functions
" ==============================================================================

" Scroll the scroll smoothly
" dir: Direction of the scroll. 'd' is downwards, 'u' is upwards
" dist: Distance, or the total number of lines to scroll
" duration: How long should each scrolling animation last. Each scrolling
" animation will take at least this long. It could take longer if the scrolling
" itself by Vim takes longer
" speed: Scrolling speed, or the number of lines to scroll during each scrolling
" animation
function! s:smooth_scroll(dir, dist, duration, speed)
  for i in range(a:dist/a:speed)
    let start = reltime()
    if a:dir ==# 'd'
      exec "normal! ".a:speed."\<C-e>".a:speed."j"
    else
      exec "normal! ".a:speed."\<C-y>".a:speed."k"
    endif
    redraw
    let elapsed = s:get_ms_since(start)
    let snooze = float2nr(a:duration-elapsed)
    if snooze > 0
      exec "sleep ".snooze."m"
    endif
  endfor
endfunction

function! s:get_ms_since(time)
  let cost = split(reltimestr(reltime(a:time)), '\.')
  return str2nr(cost[0])*1000 + str2nr(cost[1])/1000.0
endfunction

