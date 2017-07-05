""  ------------------------
""  #BASE  {{{
""  ------------------------

syntax enable
set omnifunc=syntaxcomplete#Complete
set nocompatible                " choose no compatibility with legacy vi
set wildignorecase





""  }}}
""  ------------------------
""  #WHITESPACE  {{{
""  ------------------------

set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set scrolloff=8                 " always show 8 lines above and below cursor, when possible





""  }}}
""  ------------------------
""  #APPEARANCE  {{{
""  ------------------------

set t_Co=256
" colorscheme molokai
" colorscheme alduin
colorscheme gruvbox
set background=dark
set guifont=mononoki:h16        " Set display font

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
set number                      " Add line numbers
set cursorline
set listchars=tab:▸\ ,eol:¬     " Display tabs and line endings like a Mac
set listchars+=trail:·          " Show trailing spaces as dots
set lazyredraw                  " Redraw only when we need to
set showmatch                   " Highlight matching [({})]
autocmd VimResized * wincmd =   " Automatically resize splits when window is resized

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent





""  }}}
""  ------------------------
""  #SEARCHING  {{{
""  ------------------------

set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
" Turn off search hightlights
nnoremap <leader><space> :nohlsearch<CR>





""  }}}
""  ------------------------
""  #BUFFERS  {{{
""  ------------------------

set hidden





""  }}}
""  ------------------------
""  #FILETYPES  {{{
""  ------------------------

au BufNewFile,BufRead *.txp set filetype=html





""  }}}
""  ------------------------
""  #MAPPINGS  {{{
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

"" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost vimrc source $MYVIMRC
endif

"" Quickopen vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>





""  }}}
""  ------------------------
""  #PLUGINS  {{{
""  ------------------------

"" Manage plugins
 "
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"" Configure Vim
 "
call minpac#add('tpope/vim-sensible')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('jeffkreeftmeijer/vim-numbertoggle')

"" Appearance
 "
call minpac#add('trevordmiller/nova-vim')
call minpac#add('itchyny/lightline.vim')

"" Search for text
 "
call minpac#add('rking/ag.vim')
call minpac#add('kien/ctrlp.vim')
call minpac#add('nazo/pt.vim')

"" Organize
 "
call minpac#add('vimwiki/vimwiki')
" tbabej/taskwiki

"" Distraction-free writing
 "
call minpac#add('junegunn/goyo.vim')
call minpac#add('junegunn/limelight.vim')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('timcharper/textile.vim')

"" Edit *
 "
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('scrooloose/syntastic')
call minpac#add('Townk/vim-autoclose')
call minpac#add('tpope/vim-eunuch')
call minpac#add('reedes/vim-wordy')
call minpac#add('justinmk/vim-sneak')
call minpac#add('tpope/vim-surround')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular')
call minpac#add('isa/vim-matchit')
call minpac#add('tpope/vim-unimpaired')
" SirVer/ultisnips

"" Edit CSS
 "
call minpac#add('ap/vim-css-color')
call minpac#add('mybuddymichael/vim-hexhighlight')

"" Edit HTML
 "
call minpac#add('alvan/vim-closetag')
call minpac#add('actionshrimp/vim-xpath')

"" Edit JavaScript
 "
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('leafgarland/typescript-vim')

"" Version control
 "
" airblade/vim-gitgutter
call minpac#add('phleet/vim-mercenary')





""  }}}
""  ------------------------
""  #NOVACOLORS  {{{
""  ------------------------

" https://trevordmiller.com/projects/nova
colorscheme nova
" TODO nest this in conditional check for termguicolors





""  }}}
""  ------------------------
""  #CLOSETAG  {{{
""  ------------------------

let g:closetag_filenames = "*.html,*.xhtml,*.txp,*.php"





""  }}}
""  ------------------------
""  #WRITING-TOOLS  {{{
""  ------------------------

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init()
"   autocmd FileType omm          call pencil#init()
"   autocmd FileType wiki         call pencil#init()
" augroup END





""  }}}
""  ------------------------
""  #SYNTASTIC  {{{
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





""  }}}
""  ------------------------
""  #ULTISNIPS  {{{
""  ------------------------

let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"





"" }}}
" vim:foldmethod=marker:foldlevel=0
