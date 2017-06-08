set rtp+=~/_vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'SyntaxAttr.vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tomasr/molokai'
Plugin 'mhinz/vim-startify'
call vundle#end()            " required

set autochdir

" Настраиваем переключение раскладок клавиатуры по <C-^>
set keymap=russian-jcukenwin

" Раскладка по умолчанию - английская
set iminsert=0

let mapleader=","

" line numeration
set number

set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set ruler  "show current position

" statusbar
set laststatus=2
" theme
"let g:molokai_original = 1
"let g:rehash256 = 1
colorscheme desert
" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
" Syntastic settings recommended
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" :vsplit right
set splitright
" :split bottom
set splitbelow

" vim compatible disabled
set nocompatible

" search
set ignorecase
" highliths
set hlsearch
set incsearch

" draw line where cursor
set cursorline

" use space for draw windows
set fillchars+=vert:\ 

filetype off
filetype plugin on
filetype plugin indent on

set background=dark

syntax on

"keys
nnoremap <C-n> :bnext<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <Leader>to :NERDTree<CR>
nnoremap <Leader>tc :NERDTreeClose<CR>
nnoremap <Leader>vb :buffers<CR>
nnoremap <Leader>vc :bw<CR>

"golang mode
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

let g:go_fmt_command ="goimports"
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:0',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" airline UI
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

"" separators
let g:airline#extensions#tabline#left_sep = '?'
let g:airline#extensions#tabline#left_alt_sep = '?'
let g:airline#extensions#tabline#right_sep = '?'
let g:airline#extensions#tabline#right_alt_sep = '?'
let g:airline_left_sep = '?'
let g:airline_left_alt_sep = '?'
let g:airline_right_sep = '?'
let g:airline_right_alt_sep = '?'
"let g:airline_symbols.branch = '?'
"let g:airline_symbols.readonly = '?'
"let g:airline_symbols.linenr = '?'

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['%F'])
	let g:airline_section_c = airline#section#create(['ffenc',' ','[%Y]'])
	let g:airline_section_x = airline#section#create(['%P'])   "P
	let g:airline_section_y = airline#section#create(['row:%l/%L ','(%03p%%)'])
	let g:airline_section_z = airline#section#create_right(['col:%03c'])
endfunction
autocmd VimEnter * call AirlineInit()

" nerd git statuses
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "?",
    \ "Staged"    : "?",
    \ "Untracked" : "?",
    \ "Renamed"   : "?",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "?",
    \ "Dirty"     : "?",
    \ "Clean"     : "??",
    \ "Unknown"   : "?"
    \ }

"markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown