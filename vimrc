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
set breakindent                 " when a line is wrapped, indent the trailing pseudo-lines





""  }}}
""  ------------------------
""  #APPEARANCE  {{{
""  ------------------------

set t_Co=256
" colorscheme molokai
" colorscheme alduin
colorscheme gruvbox
set background=dark
if has("gui_running") " Don't set display font in NeoVim
  set guifont=mononoki:h16        " Set display font
endif

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
""  #HISTORY  {{{
""  ------------------------

"" Maintain undo history between sessions
 "
set undofile
set undodir=~/.vim/undodir

"" Have swapfiles ever come in handy?
 "
set noswapfile





""  }}}
""  ------------------------
""  #SEARCHING  {{{
""  ------------------------

set path+=**                    " searc down into subfolders
set wildmenu                    " display all matching files with tab completion
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
" Turn off search hightlights
nnoremap <leader><space> :nohlsearch<CR>
set inccommand=nosplit          " Show interactive replacement text





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

"" Switch windows, using Unimpaired-type mappings
nmap ]w <C-w>w
nmap [w <C-w>W

"" Close open XML tags using Space-.
" autocmd BufNewFile,BufRead *.html imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.htm imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.xml imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.txp imap <leader>/ </<C-X><C-O>
" autocmd BufNewFile,BufRead *.php imap <leader>/ </<C-X><C-O>





""  }}}
""  ------------------------
""  #ABBREVIATIONS  {{{
""  ------------------------

"" Useful logging commands
iabbrev <expr> ddate strftime('%F')
iabbrev <expr> qdate strftime('%e %mmo. %Y')
iabbrev <expr> ldate strftime('%e %mmo. ~ Week %W: Day %w')
iabbrev <expr> ttime strftime('%R')

"" Design problem/solution log template
"" https://routley.io/tech/2017/11/23/logbook.html
iabbrev llog Consider the problem you’re attempting to solve::<CR>Describe your method for solving it::<CR>Describe the process of carrying out the method::<CR>Record what happened, and ask how it could be improved::<Esc>3kA

"" Decision log entry template
"" https://fs.blog/2014/02/decision-journal/
iabbrev ddlog Situation/Context::<CR>Problem::<CR>Variables that govern the situation include::<CR>Complications/complexities as I see them::<CR>Serious alternatives that were not chosen::<CR>Explain the range of outcomes::<CR>Expected outcome, reasons, and probabilies for each outcome::<CR>Time of day, physical and mental feelings::<Esc>7kA





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
call minpac#add('machakann/vim-highlightedyank')
" call minpac#add('gioele/vim-autoswap')
call minpac#add('chrisbra/Recover.vim')

"" Appearance
 "
call minpac#add('trevordmiller/nova-vim')
call minpac#add('itchyny/lightline.vim')
call minpac#add('mhinz/vim-startify')
call minpac#add('ayu-theme/ayu-vim')

"" Search and navigate
 "
call minpac#add('rking/ag.vim')
call minpac#add('kien/ctrlp.vim')
call minpac#add('nazo/pt.vim')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('tpope/vim-vinegar')

"" Organize
 "
call minpac#add('vimwiki/vimwiki', { 'branch': 'dev' })
call minpac#add('tbabej/taskwiki')
"" Recommended for Taskwiki
call minpac#add('powerman/vim-plugin-AnsiEsc')
call minpac#add('majutsushi/tagbar')

"" Syntax
 "
call minpac#add('sheerun/vim-polyglot')

"" Distraction-free writing
 "
call minpac#add('junegunn/goyo.vim')
call minpac#add('junegunn/limelight.vim')
" call minpac#add('plasticboy/vim-markdown') " Included by vim-polyglot
" call minpac#add('timcharper/textile.vim') " Included by vim-polyglot

"" Edit *
 "
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-commentary')
" call minpac#add('scrooloose/syntastic')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tpope/vim-eunuch')
call minpac#add('reedes/vim-wordy')
call minpac#add('justinmk/vim-sneak')
call minpac#add('tpope/vim-surround')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular')
call minpac#add('isa/vim-matchit')
call minpac#add('tpope/vim-unimpaired')
" call minpac#add('SirVer/ultisnips')

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
" call minpac#add('mxw/vim-jsx') " Included by vim-polyglot
call minpac#add('flowtype/vim-flow')
" call minpac#add('leafgarland/typescript-vim') " Included by vim-polyglot
call minpac#add('w0rp/ale')

"" Edit Elm
 "
" call minpac#add('ElmCast/elm-vim') " Included by vim-polyglot

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

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_html_checkers=['']
" let g:syntastic_js_checkers=[ 'jshint' ]
" let g:syntastic_sass_checkers=[ 'sass', 'sassc' ]





""  }}}
""  ------------------------
""  #ULTISNIPS  {{{
""  ------------------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippets']
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"





""  }}}
""  ------------------------
""  #STARTIFY  {{{
""  ------------------------

let g:ascii = [
      \ '    ',
      \ '     _    ___',
      \ '    | |  / (_)___ ___       REMOVE DISTRACTIONS',
      \ '    | | / / / __ `__ \    CHOOSE ONE SMALL STEP',
      \ '    | |/ / / / / / / /              DO  IT  NOW',
      \ '    |___/_/_/ /_/ /_/             KEEP STARTING',
      \ '    ',
      \ '    ',
      \ ]

let g:startify_custom_header = g:ascii





""  }}}
""  ------------------------
""  #VIMWIKI  {{{
""  ------------------------

let g:vimwiki_list = [{'diary_rel_path': '', 'diary_index': 'log', 'diary_header': 'Log'}]




""  }}}
""  ------------------------
""  #ALE CONFIG  {{{
""  ------------------------

" let g:ale_fixers = {}
" let g:ale_fixers = {
"       \ 'javascript': ['prettier', 'babel-eslint'],
"       \ 'php': ['ale-php-hack']
"       \ }





"" }}}
" vim:foldmethod=marker:foldlevel=0
