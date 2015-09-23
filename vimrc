""  ------------------------
""  #BASE
""  ------------------------

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set history=200
filetype plugin indent on       " load file type plugins + indentation

"" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"" Quickopen vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>





""  ------------------------
""  #WHITESPACE
""  ------------------------

set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set scrolloff=8                 " always show 8 lines above and below cursor, when possible





""  ------------------------
""  #APPEARANCE
""  ------------------------

set t_Co=256
colorscheme molokai
set guifont=Monaco:h14          " Set display font

" set columns=84
" set foldcolumn=6
" set colorcolumn=80
set guioptions-=T               " Removes top toolbar
set guioptions-=r               " Removes right hand scroll bar
set go-=L                       " Removes left hand scroll bar
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
" autocmd VimResized * if (&columns > 84) | set columns=84 | endif
set wrap                        " Wrap lines
set linebreak
set showbreak=…
" set textwidth=72                " Document width
" set formatoptions=qrn1          " Do not know
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
set list
set nu                          " Add line numbers
set listchars=tab:▸\ ,eol:¬     " Display tabs and line endings like a Mac
set listchars+=trail:·          " Show trailing spaces as dots





""  ------------------------
""  #SEARCHING
""  ------------------------

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter





""  ------------------------
""  #BUFFERS
""  ------------------------

set hidden





""  ------------------------
""  #FILETYPES
""  ------------------------

au BufNewFile,BufRead *.txp set filetype=html





""  ------------------------
""  #MAPPINGS
""  ------------------------

"" Use Vim motions: Disable mouse and arrow keys
set mouse=
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

"" Use spacebar to center current line in editor
" nmap <space> zz

"" Automatically center search results in editor
nmap n nzz
nmap N Nzz

"" Let me use semicolon to enter command mode
nnoremap ; :
nnoremap : ;

"" Use comma as <leader> key instead of backslash
" let mapleader = ","

"" Type ,, to alternate between files
" nnoremap <leader><leader> <c-^>

"" Use Spacebar as <leader>
let mapleader = "\<Space>"

"" Type Space-o to open a new file
nnoremap <Leader>o :CtrlP<CR>
"" Type Space-w to save fast
nnoremap <Leader>w :w<CR>

"" Access system clipboard using Space-y and Space-p
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" Switch windows, using Unimpaired-type mappings
nmap ]w <C-w>w
nmap [w <C-w>W

"" Close open XML tags using Space-.
" autocmd BufNewFile,BufRead *.html imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.htm imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.xml imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.txp imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.php imap <leader>/ </<C-X><C-O>





""  ------------------------
""  #PLUGINS
""  ------------------------

execute pathogen#infect()






""  ------------------------
""  #CLOSETAG
""  ------------------------

let g:closetag_filenames = "*.html,*.xhtml,*.txp,*.php"





""  ------------------------
""  #AIRLINE
""  ------------------------

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'





""  ------------------------
""  #SYNTASTIC
""  ------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:syntastic_js_checkers=[ 'jshint' ]
let g:syntastic_sass_checkers=[ 'sass', 'sassc' ]





""  ------------------------
""  #ULTISNIPS
""  ------------------------

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"





""  ------------------------
""  #VMATH
""  ------------------------

" vmap <expr>  ++  VMATH_YankAndAnalyse()
" nmap         ++  vip++
