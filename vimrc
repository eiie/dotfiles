" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
		filetype plugin indent on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
endif

set nocompatible

" Show numbers
set number
set relativenumber

" Colors and themes
syntax on
colorscheme slate

" Indentation 
set autoindent
set tabstop=4

" Wildmenu
set wildmenu
"set wildmode=list,longest

" Buffers : permet d'utiliser argdo et bufdo sur plusieurs buffers avec une
" seule commande
set hidden

" Search
set hlsearch " surlignage des recherches
set incsearch " recherche dès la première frappe
set smartcase " ignore la casse si la recherche est faite en minuscule

"
set showmatch " surligne les parenthèse correspondantes

" History
set history=1000
set undolevels=1000

" Supress sounds
set visualbell
set noerrorbells

" Title
" set list " terminer les lignes par un $

" Mouse
"set mouse=a " activation de la souris

" Desactivate arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <right> <nop>
vnoremap <left> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>

" j and k occur on display lines instead of real lines
" nnoremap j gj
" nnoremap k gk

" gj and gk occur on real lines instead of display lines
" nnoremap gj j
" nnoremap gk k

" Remplace C-W + hjkl by C-hjkl
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Desactivate arrow keys in command line mode
cnoremap <up> <nop>
cnoremap <down> <nop>

" make <C-p> and <C-n> filter the command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" set textwidth=80

" changer $ et 0 pour L et H ?
" changer <c-d> et <c-u> pour J et K
" dans ce cas mapping pour J et K ?
" besoin d'un raccourci pour remplacer <c-[> ainsi que tous les raccourcis utilisant alt gr 
" changer la touche <esc> pour revenir en mode normal ? 


" Learn vim the hard way {{{
" clear a line with <leader>d
nnoremap <leader>d ddO
" uppercase a word in insert mode
" imap <c-u> <esc>viwUi
" uppsercase a word in normal mode
" nmap <c-u> viwU
" map leader and localleader
let mapleader = "\\"
let maplocalleader = "\\"
" fast way to edit .vimrc
nnoremap <leader>ev :vert new $HOME/.vim/vimrc<cr>
" fast way to source .vimrc
nnoremap <leader>sv :source $HOME/.vim/vimrc<cr>
" some abbreviations
iabbrev ssig eiie
iabbrev eex example of a long abbreviation
" raccourci : mettre entre double quote
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" raccourci : mettre entre simple quote
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" raccourci en mode visuel : mettre entre double quote
vnoremap <leader>" <esc>`<i"<esc>`>lli"<esc>
" raccourci en mode visuel : mettre entre simple quote
vnoremap <leader>' <esc>`<i'<esc>`>lli'<esc> 

" les groupes autocmd sont nécessaire pour ne pas charger des autocmd plusieurs fois (par exemple quand on source le fichier .vimrc
augroup other
		autocmd!
		" commande automatique de création de fichier .txt dès qu'on l'édite
		autocmd BufNewFile *.txt :write
		" commande automatique désactivant l'option "wrap" sur les fichiers *.py
		autocmd BufNewFile,BufRead *.py setlocal nowrap
augroup end

" groupe autocmd
" commande automatique activant le raccourci <leader>c pour écrire des commentaires en fonction du type de fichier
" commande automatique "if" en fonction du type de fichier

augroup filetype_js
		autocmd!
		autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
		autocmd Filetype javascript nnoremap <buffer> <localleader>c I//<esc>
augroup end

augroup filetype_py
		autocmd!
		autocmd FileType python :iabbrev <buffer> iff if:<left>
		autocmd Filetype python nnoremap <buffer> <localleader>c I#<esc>
augroup end

" operator-pending mappings
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
augroup filetype_md
		autocmd!
		autocmd FileType markdown onoremap <buffer> i= :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
		autocmd FileType markdown onoremap <buffer> i- :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
augroup end

" status line general (gestion des barres de status en fonction des types de fichiers (autocmd)
set statusline=%F	" full path to the file
set statusline+=%=	" switch to the right side
set statusline+=%l	" current line
set statusline+=/	" separator
set statusline+=%L	" total lines

" Vimscript file settings ------------ {{{
" folding
augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ouverture du dernier buffer dans un vsplit à droite
nnoremap <leader>bb :<c-u>execute "rightbelow vsplit " .bufname("#")<cr>
" ajout d'un ; à la fin d'une ligne
nnoremap <leader>; :normal! mqA ;<esc>`q

"}}}
"

" Format hexadécimal pour les raccourcis <C-a> <C-x>
set nrformats=hex

" Remplace %:h<Tab> par %% 
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
