" Plugins {{{
let s:rc = expand( "$HOME/.vimrc_plugins" )
if filereadable( s:rc )
  " note that NixOS is handling plugins differently
  " so, there is no .vimrc_plugins file for NixOS configuration
  execute ':source '.s:rc
endif
" }}}

" Basic {{{
syntax on
filetype plugin indent on
set nocompatible
set number
set relativenumber
set nowrap
set showmode
set textwidth=0
set colorcolumn=0
set smartcase
set smarttab
set smartindent
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set incsearch
set hlsearch
set ignorecase
set mouse=a
set history=1000
" set clipboard=unnamedplus,autoselect
" set completeopt=menuone,menu,longest
set t_Co=256
set cmdheight=1
set encoding=utf-8
set fileencodings=utf-8
" set nospell
" set nobackup
" set noswapfile
set undofile
set undodir=~/.vim/undo
set hidden
set nocursorline
set laststatus=2
set backspace=indent,eol,start
set linespace=1
set showmatch
set foldmethod=marker
set foldenable
set foldlevelstart=10
set foldnestmax=10
set listchars=tab:•\ ,trail:•,extends:»,precedes:« 
set list
set showbreak=>>\ 
set lazyredraw
" set diffopt+=iwhite
if exists('g:loaded_fugitive')
  set statusline+=%{fugitive#statusline()}
endif
" if has('win32')
"   set wildignore+=*\\.stack-work\\*,*\\packages\\*,*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,*.dll,*.exe,*\\obj\\*,*\\bin\\*,*.mdb,*.pdb
" else
set wildignore+=*/.stack-work/*
set wildignore+=*/packages/*
set wildignore+=*/tmp/*
set wildignore+=*/obj/*
set wildignore+=*/bin/*
set wildignore+=*/build/*
set wildignore+=*/elm-stuff/*
set wildignore+=*/.git/*
set wildignore+=*/.cabal-sandbox/*
set wildignore+=*.swp
set wildignore+=*.swo
set wildignore+=*.zip
set wildignore+=*.dll
set wildignore+=*.exe
set wildignore+=*.mdb
set wildignore+=*.pdb
set wildignore+=*.xml
set wildignore+=*.XML
set wildignore+=*.sigdata
set wildignore+=*.optdata
set wildignore+=*.gitattributes
set wildignore+=*.psmdcp
set wildignore+=*.srcsrv
set wildignore+=*.nupkg
set wildignore+=*.png
set wildignore+=*.jpg
set wildignore+=*.jpeg
set wildignore+=*.gif
set wildignore+=*.svg
" endif
set wildmode=longest,list,full
set wildmenu
set wildignorecase
" }}}

" GUI {{{
if has( "gui_running" )
  set columns=153
  set lines=38
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guifont=monofur\ for\ Powerline\ 15
  set background=dark
  colorscheme abra
else
  set background=dark
  colorscheme default
endif
" }}}

" Mapping {{{
let mapleader=","
map <space> <leader>
map <space><space> <leader><leader>
nnoremap <F5> :make<CR>
nnoremap <C-c> :cclose<CR>
nnoremap <space><space> :nohlsearch<CR>
nmap <leader>zz :let &scrolloff=999-&scrolloff<CR>
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <C-j> :bd<CR>
nmap <S-Tab> :NERDTreeToggle<CR>
nmap <F2> <Plug>ColorstepPrev
nmap <F3> <Plug>ColorstepNext
nmap <F4> <Plug>ColorstepReload
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>/ "zyiw:vimgrep /<C-r>z/g **/*<CR>:cw<CR>
autocmd FileType haskell map <silent> <leader>t :GhcModType<CR>
autocmd FileType haskell map <silent> <leader>T :GhcModTypeInsert<CR>
autocmd FileType haskell map <silent> <leader>c :GhcModTypeClear<CR>
autocmd FileType haskell map <silent> <leader>i :GhcModInfo<CR>
autocmd FileType haskell map <silent> <leader>I :GhcModInfoPreview<CR>
autocmd FileType haskell map <silent> <leader>l :GhcModLint<CR>
autocmd FileType haskell map <silent> <leader>e :GhcModExpand<CR>
autocmd FileType haskell map <silent> <leader>g :GhcModSigCodegen<CR>
autocmd FileType haskell map <silent> <leader>s :GhcModSplitFunCase<CR>
autocmd FileType haskell vmap a= :Tabularize /=<CR>
autocmd FileType haskell vmap a; :Tabularize /::<CR>
autocmd FileType haskell vmap a- :Tabularize /-><CR>
autocmd FileType haskell vmap a, :Tabularize /<-<CR>
autocmd FileType haskell vmap al :Tabularize /[\[\\|,]<CR>
nnoremap <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" }}}

" Configure airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_powerline_fonts = 0
" let g:airline_theme='papercolor'
let g:airline_theme = 'quantum'
" }}}

" CtrlP {{{
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_show_hidden = 1
let g:ctrlp_path_nolim = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v[\/]dist$'
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}

" Haskell {{{
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:haskell_tabular = 1
" }}}

" Markdown {{{
au BufEnter *.md set tw=80
au BufEnter *.md set filetype=markdown
au BufEnter *.md set syntax=markdown
au BufEnter *.md set spell
" }}}

" Vimwiki {{{
let g:vimwiki_list = [{'path':'~/.vimwiki'}]
" }}}

" Xml {{{
" recognize Xml format
au BufEnter *.xml set filetype=xml
au BufEnter *.xml set syntax=xml
au BufReadPre *.xml setlocal foldmethod=indent
" }}}

" Elm {{{
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1
" }}}

" F# {{{
let g:syntastic_fsharp_checkers=['syntax']
let g:fsharp_only_check_errors_on_write = 0
let g:fsharp_completion_helptext = 1
let g:fsharp_map_keys = 1
" let g:fsharp_map_prefix = 'cp'
let g:fsharp_map_gotodecl = 'g'
let g:fsharp_map_gobackfromdecl = 'b'
" }}}

" NERDTree {{{
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 40
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.swp$', '^bin$', '^obj$', '^dist$']
" let g:NERDTreeHighlightCursorline = 1
" let g:NERDTreeCaseSensitiveSort = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
" let g:NERDTreeShowBookmarks = 1
" let NERDTreeHijackNetrw = 1
let g:NERDChristmasTree = 1
" }}}
