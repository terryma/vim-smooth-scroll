# vim-smooth-scroll

## About
[vim-smooth-scroll] makes scrolling in Vim nice and smooth. Find yourself completely lost every time you use ```Ctrl-f``` or  ```Ctrl-b```? You might want to give this plugin a try.

## Installation
Install using [Pathogen], [Vundle], [Neobundle], or your favorite Vim package manager.

## Quick Start
Map your favorite keys like below:

```vim
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
```

## Function
```smooth_scroll#up``` and ```smooth_scroll#down``` both take the following 3 parameters. Customize it however you like
- __Distance__: This is the total number of lines you want to scroll
- __Duration__: This is how long you want each frame of the scrolling animation to last in __milliseconds__. Each frame will take _at least_ this amount of time. It could take more if Vim's scrolling itself is slow
- __Speed__: This is how many lines to scroll during each frame of the scrolling animation

[vim-smooth-scroll]:http://github.com/terryma/vim-smooth-scroll
[Pathogen]:http://github.com/tpope/vim-pathogen
[Vundle]:http://github.com/gmarik/vundle
[Neobundle]:http://github.com/Shougo/neobundle.vim
