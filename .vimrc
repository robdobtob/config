"""""""""""""""""
" Viewing Options
"""""""""""""""""
"" LineNumbers
set number
set relativenumber

" supposedly stop vim making noise
set belloff=all
set vb t_vb=

" change curser behaviour for insert mode
if empty($TMUX)
  " Vertical bar in insert mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " Block in normal mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  " Underline in replace mode
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  " Vertical bar in insert mode
  let &t_SI = "\e[5 q"
  " Block in normal mode
  let &t_SR = "\e[4 q"
  " Underline in replace mode
  let &t_EI = "\e[1 q"
endif
" address lag between mode changes
" https://stackoverflow.com/a/58042714
set ttimeout
set ttimeoutlen=1
set ttyfast

" Scroll behaviour to keep cursor more centered
set scrolloff=5
nnoremap <C-d> <C-d>zz

cnoreabbrev tn tabnew

" Search behaviour to only be case sensitive if search term has uppercase
set smartcase

"""""""""""""""""
" Software Things
"""""""""""""""""
"" yank
" yank to both default register and clipboard
vnoremap Y "+y

"" Tabs
set expandtab
set tabstop=2
" mirror that of tabstop
set shiftwidth=0

"""""""""""""""""
" Text Editing
"""""""""""""""""
" Line split on every fullstop. used to separate markdown lines
vnoremap gl :s/\. /.\r/g<CR><ESC>

