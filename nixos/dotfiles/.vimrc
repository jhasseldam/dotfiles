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
" }}}

" GUI {{{
if has( "gui_running" )
  set columns=153
  set lines=38
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guifont=Fira\ Mono\ 12
  set background=dark
  " colorscheme Tomorrow-Night-Bright
  " colorscheme quantum
  " let g:quantum_black = 1
  " let g:quantum_italics = 1
  " colorscheme spacemacs-theme
  " colorscheme PaperColor
  " let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
  " let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
  colorscheme abra
  " colorscheme bclear
  " colorscheme winter
else
  set background=dark
  colorscheme default
endif
" }}}

" Mapping {{{
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
let mapleader=","
nmap <F5> :make<CR>
nmap <leader><leader> :nohlsearch<CR>
" set scrolloff to toggle always placing cursor in the middle
nmap <leader>zz :let &scrolloff=999-&scrolloff<CR>
" " visual block movement
" vmap J :m '>+1<CR>gv=gv
" vmap K :m '<-2<CR>gv=gv
" " highlight last inserted code
" nmap gV `[v`]
" buffer management
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <C-j> :bd<CR>
nmap <S-Tab> :NERDTreeToggle<cr>
" " Auto-detect encoding
" :nmap <leader>x :FencAutoDetect<CR>
" ColorStepper Keys
nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload
" CtrlP
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>d :CtrlPDir<cr>
map <leader>q :CtrlPQuickfix<cr>
map <leader>t :CtrlPTag<cr>
" VimGrep - search for a word under cursor
nnoremap <Leader>g "zyiw:vimgrep /<C-r>z/g **/*<CR>:cw<CR>
" Syntastic
map <leader>s :SyntasticToggleMode<CR>
" Haskell
" map <silent> ts :GhcModSplitFunCase<CR>
map <silent> ti :GhcModTypeInsert<CR>
map <silent> tt :GhcModType<CR>
map <silent> tc :GhcModTypeClear<CR>
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
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

" LaTeX {{{
"au BufEnter *.tex setl tw=79 tx ts=4 sw=4 fo+=n2a
au BufEnter *.tex setl tw=80
if has('unix')
  au BufEnter *.tex nnoremap <buffer> <F7> :silent !xdg-open '%:p:r.pdf' &<CR>
endif
" }}}

" Markdown {{{
au BufEnter *.md set tw=80
au BufEnter *.md set filetype=markdown
au BufEnter *.md set syntax=markdown
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
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 40
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.swp$', '^bin$', '^obj$']
" let g:NERDTreeHighlightCursorline = 1
" let g:NERDTreeCaseSensitiveSort = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
" let g:NERDTreeShowBookmarks = 1
" let NERDTreeHijackNetrw = 1
let g:NERDChristmasTree = 1
" }}}
