let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

"set langmenu=en_US
"let $LANG = 'en_US'
set hlsearch
set incsearch
set ignorecase
set smartcase
"just do it 
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab "how long of tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7" "not usful in macOS
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"set clipboard=unnamedplus
noremap n nzz
noremap N Nzz
noremap <LEADER><LEADER> :nohlsearch<CR>
noremap <LEADER><CR> o<ESC><ESC>

"上下左右使用jikl替代
"        i
"     j    l
"        k
noremap i k
noremap k j
noremap j h
noremap K 5j
noremap I 5k
noremap J 5h
noremap L 5l
noremap <C-j> 0
noremap <C-l> $

"光标前插入使用h/H
noremap h i
noremap H I

"remap K to m to open the man at cursor
noremap m K

vnoremap Y "+y
nnoremap yl y$
nnoremap Yl "+y$
nnoremap Yw "+yw
nnoremap YW "+yW
nnoremap YY "+yy
noremap P "+p

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

"===split screen
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

map <up> :resize +5<CR>
map <down> :resize -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

map tn :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>


exec "nohlsearch"

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'voldikss/vim-translator'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/goyo.vim'
""plug 'kshenoy/vim-signature'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'junegunn/vim-peekaboo'
"Plug 'preservim/nerdtree'
"Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'jupyter-vim/jupyter-vim'
call plug#end()
"===
"===translate
"===
nmap <silent> ts <Plug>TranslateW
vmap <silent> ts TranslateW

" ===
" === NERDTree
" ===
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "<S-j>"
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeMapActivateNode = ""
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = "<LEADER>"
let NERDTreeMapCloseDir = "j"
let NERDTreeMapChangeRoot = "y"
let NERDTreeMapCWD = "cd"
let NERDTreeMapChdir ="<S-l>"

let NERDTreeMenuUp = "i"
let NERDTreeMenuDown = "k"
let NERDTreeMapJumpNextSibling = ""
let NERDTreeMapJumpPrevSibling = ""
let NERDTreeMapJumpParent = "j"
let NERDTreeMapJumpFirstChild = ""
let NERDTreeMapCustomOpen = "l" 
" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"===
"===background color snazzy
"===
color snazzy
let g:SnazzyTransparent=1
"===
"===MarkdownPreview configuration
"=== 
" specify browser to open preview page
" default: ''
let g:mkdp_auto_start = 1
let g:mkdp_browser = 'firefox'
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter> 

" F5 to run sh/python3
map <c-e> :call CompileRunGcc()<CR>`
func! CompileRunGcc()
    exec "w"
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!python3.8 %"
    endif
endfunc

