set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 13
syntax enable
if has( "gui_running" )
  set background=dark
  colorscheme PaperColor
  " let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
  " let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
else
  set background=dark
  colorscheme default
endif
set number
set relativenumber
filetype plugin indent on
set mouse=a
set encoding=utf-8
set fileencodings=utf-8
set history=1000
set nospell
set nobackup
set noswapfile
set noundofile
set textwidth=0
set colorcolumn=0
set hidden
if has("gui_running")
  set nocursorline
  set columns=153
  set lines=38
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif
set showmode
set laststatus=2
if exists('g:loaded_fugitive')
  set statusline=%{fugitive#statusline()}
endif
set backspace=indent,eol,start
set linespace=1
set number
set relativenumber
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set foldmethod=marker
set foldenable
set foldlevelstart=10
set foldnestmax=10
set listchars=tab:•\ ,trail:•,extends:»,precedes:« 
set list
set showbreak=>>\ 
set wildmenu
set lazyredraw
set nowrap
set autoindent
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
" set diffopt+=iwhite

" Mapping {{{
:nnoremap <F2> :w<CR>
:nnoremap <F5> :make<CR>
:nnoremap <leader><leader> :nohlsearch<CR>
" set scrolloff to toggle always placing cursor in the middle
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>
" visual block movement
:vnoremap J :m '>+1<CR>gv=gv
:vnoremap K :m '<-2<CR>gv=gv
" highlight last inserted code
:nnoremap gV `[v`]
" buffer management
:nnoremap <C-h> :bp<CR>
:nnoremap <C-l> :bn<CR>
:nnoremap <C-j> :bd<CR>
:nnoremap <C-k> :tabnew<CR>
" " Auto-detect encoding
" :nnoremap <leader>x :FencAutoDetect<CR>
" NERDTree
:nnoremap <leader>e :NERDTree<CR>
" }}}

" Configure airline {{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts=1
if has( "gui_running" )
  let g:airline_powerline_fonts = 1
  let g:airline_theme='papercolor'
else
  let g:airline_theme='papercolor'
endif
" }}}

" CtrlP {{{
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_show_hidden = 1
let g:ctrlp_path_nolim = 1
if has('win32')
  set wildignore+=*\\.stack-work\\*
  set wildignore+=*\\packages\\*
else
  set wildignore+=*/.stack-work/*
  set wildignore+=*/packages/*
endif
" }}}

" Haskell {{{
" Some of this setup is from http://www.sillybytes.net/2016/08/vim-haskell_11.html?utm_content=46778807&utm_medium=social&utm_source=twitter
hi ghcmodType ctermbg=yellow
let g:ghcmod_type_highlight = 'ghcmodType'
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 0
let g:necoghc_debug = 0
let g:hindent_on_save = 1
let g:hindent_line_length = 80
let g:hindent_indent_size = 2
augroup Haskell
  au!
  au FileType haskell setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftround
  au FileType haskell setlocal omnifunc=necoghc#omnifunc
  au FileType haskell nnoremap <silent><buffer> git :GhcModTypeInsert<CR>
  au FileType haskell nnoremap <silent><buffer> gfs :GhcModSplitFunCase<CR>
  au FileType haskell nnoremap <silent><buffer> gtt :GhcModType<CR>
  au FileType haskell nmap <silent><buffer> g<space> vii<ESC>:silent!'<,'> EasyAlign /->/<CR>
  " " types abbreviations
  " au FileType haskell inoreab <buffer> int Int
  " au FileType haskell inoreab <buffer> integer Integer
  " au FileType haskell inoreab <buffer> string String
  " au FileType haskell inoreab <buffer> double Double
  " au FileType haskell inoreab <buffer> float Float
  " au FileType haskell inoreab <buffer> true True
  " au FileType haskell inoreab <buffer> false False
  " au FileType haskell inoreab <buffer> maybe Maybe
  " au FileType haskell inoreab <buffer> just Just
  " au FileType haskell inoreab <buffer> nothing Nothing
  " au FileType haskell inoreab <buffer> io IO ()
augroup END
" }}}

" LaTeX {{{
"au BufEnter *.tex setl tw=79 tx ts=4 sw=4 fo+=n2a
au BufEnter *.tex setl tw=79
if has('unix')
  au BufEnter *.tex nnoremap <buffer> <F7> :silent !xdg-open '%:p:r.pdf' &<CR>
endif
" }}}

" Markdown {{{
au BufEnter *.md set filetype=markdown
au BufEnter *.md set syntax=markdown
" }}}

" Xml {{{
" recognize Xml format
au BufEnter *.xml set filetype=xml
au BufEnter *.xml set syntax=xml
au BufReadPre *.xml setlocal foldmethod=indent
" }}}

" Elm {{{
" let g:elm_jump_to_error = 0
" let g:elm_make_output_file = "elm.js"
" let g:elm_make_show_warnings = 0
" let g:elm_syntastic_show_warnings = 0
" let g:elm_browser_command = ""
" let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 1
let g:elm_classic_highlighting = 0
" au BufEnter *.elm nnoremap <buffer> <leader> f :ElmFormat<CR>
" }}}
