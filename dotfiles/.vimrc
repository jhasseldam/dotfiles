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
  set guifont=Iosevka\ 16
  set background=dark
  colorscheme quantum
  hi Conceal ctermfg=7 ctermbg=8 guifg=LightGray guibg=#263238
  hi Search term=reverse ctermfg=236 ctermbg=221 guifg=#222222 guibg=#ff7777
  hi IncSearch term=reverse cterm=reverse ctermfg=221 gui=reverse guifg=#ff4444 guibg=#222222
  " Syntax highlighting
  hi Comment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#878787 guibg=NONE gui=italic
  hi Constant ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
  hi String ctermfg=151 ctermbg=NONE cterm=NONE guifg=#AFD7AF guibg=NONE gui=NONE
  hi Number ctermfg=179 ctermbg=NONE cterm=NONE guifg=#D7AF5F guibg=NONE gui=NONE
  hi PreProc ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
  hi Identifier ctermfg=147 ctermbg=NONE cterm=NONE guifg=#AFAFFF guibg=NONE gui=NONE
  hi Statement ctermfg=171 ctermbg=NONE cterm=NONE guifg=#D75FFF guibg=NONE gui=NONE
  hi Type ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
  hi Special ctermfg=179 ctermbg=NONE cterm=NONE guifg=#D7AF5F guibg=NONE gui=NONE
  hi Underlined ctermfg=119 ctermbg=NONE cterm=underline guifg=#87FF5F guibg=NONE gui=underline
  hi Error ctermfg=168 ctermbg=NONE cterm=underline guifg=#D75F87 guibg=NONE gui=underline
  hi Todo ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
  "hi Ignore
  hi link Character Constant
  hi link Boolean Constant
  hi link Float Number
  hi link Function Identifier
  hi link Conditional Statement
  hi link Repeat Statement
  hi link Operator Statement
  hi link Keyword Statement
  hi link Label Statement
  hi link Exception Statement
  hi link Include Preproc
  hi link Define Preproc
  hi link Macro PreProc
  hi link PreCondit PreProc
  hi link StorageClass Type
  hi link Structure Type
  hi link Typedef Type
  hi link SpecialChar Special
  hi link Tag Special
  hi link Delimiter Special
  hi link SpecialComment Special
  hi link Debug Special
  " HTML
  hi link htmlTag Statement
  hi link htmlTagName Constant
  hi link htmlEndTag Statement
  hi link htmlSpecialTagName Number
  hi link htmlArg Statement
  hi link javaScript Normal
  hi htmlItalic ctermfg=252 ctermbg=NONE cterm=NONE
  " XML
  hi link xmlEndTag Keyword
  " Javascript
  hi link javaScriptIdentifier Type
  hi link javaScriptDOMMethods Normal
  hi link javaScriptDOMProperties Normal
  hi link javaScriptNumber Number
  hi link javaScriptParens Preproc
  hi link javaScriptFuncArg Normal
  hi javaScriptFuncDef ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
  " Ruby
  hi rubyRegexp ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
  hi rubyRegexpDelimiter ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
  hi rubyIdentifier ctermfg=252 ctermbg=NONE cterm=NONE guifg=#D0D0D0 guibg=NONE gui=NONE
  hi link rubyAccess Special
  hi link rubyConstant Constant
  hi link rubyFunction Constant
  hi link rubyKeyword Number
  hi link rubySymbol Identifier
  hi link rubySymbolDelimiter Delimiter
  hi link rubyClassVariable Identifier
  hi link rubyInstanceVariable Identifier
  hi link rubyBlockParameter Normal
  hi link rubyBoolean Normal
  hi link rubyPseudoVariable Constant
  hi link rubyPredefinedVariable Type
  " eruby
  hi link erubyDelimiter Special
  " Python
  hi link pythonFunction Constant
  " CoffeeScript
  hi link coffeeBlock Preproc
  hi link coffeeSpecialIdent Normal
  hi link coffeeObject Constant
  " hi link coffeeSpecialIdent Number
  " php
  hi link phpParent Normal
  " go
  hi link goDirective Preproc
  hi link goDeclaration Preproc
  hi link goField Special
  hi link goFunction Type
  hi link goFunctionCall Identifier
  hi link goMethodCall Identifier
  hi link goReceiverType Identifier
  " Markdown
  hi markdownH3 ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
  hi markdownH4 ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
  hi markdownH5 ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
  hi markdownH6 ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
  " vim-gitgutter
  hi GitGutterAdd ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
  hi GitGutterChange ctermfg=179 ctermbg=NONE cterm=NONE guifg=#D7AF5F guibg=NONE gui=NONE
  hi GitGutterDelete ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
  " Haskell
  "hi cPreCondit ctermfg=166 guifg=#cb4b16
  hi VarId ctermfg=33 guifg=#cccccc
  "hi ConId ctermfg=136 guifg=#b58900
  hi hsImport ctermfg=125 guifg=#d33682
  hi hsString ctermfg=244 guifg=#00cc00
  hi hsStructure ctermfg=37 guifg=cyan
  hi hs_hlFunctionName ctermfg=33 guifg=#8888ff
  hi hsStatement ctermfg=37 guifg=cyan
  hi hsImportLabel ctermfg=37 guifg=cyan
  hi hsComment ctermfg=37 guifg=#aa6666
  "hi hs_OpFunctionName ctermfg=136 guifg=#b58900
  hi hs_DeclareFunction ctermfg=166 guifg=#cb4b16
  hi hsVarSym ctermfg=37 guifg=orange
  hi hsType ctermfg=136 guifg=#ff6666
  hi hsTypedef ctermfg=37 guifg=#2aa198
  hi hsModuleName ctermfg=64 guifg=orange
  hi hsModuleStartLabel ctermfg=125 guifg=cyan
  hi link hsImportParams Delimiter
  hi link hsDelimTypeExport Delimiter
  hi link hsModuleStartLabel hsStructure
  hi link hsModuleWhereLabel hsModuleStartLabel
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
" nnoremap <leader>/ "zyiw:vimgrep /<C-r>z/g **/*<CR>:cw<CR>
nnoremap <leader>/ "zyiw:vimgrep /<C-r>z/gj **/*.%:e<CR>:cw<CR>
nnoremap <leader>g "zyiw:vimgrep /<C-r>z/gj **/*
nnoremap <leader>dd :diffthis<CR>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>do :diffoff<CR>
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
let g:airline_powerline_fonts = 1
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
let g:hindent_on_save = 0
let g:hindent_indent_size = 2
let g:hindent_line_length = 100

hi hsStructure gui=NONE guifg=#2060A0
hi hsStatement gui=NONE guifg=#2060A0
hi hsTypedef gui=NONE guifg=#2060A0
hi hsConditional gui=NONE guifg=#2060A0
hi hsInfix gui=NONE guifg=#2060A0
hi hsType gui=NONE guifg=#008080
hi hsOperator gui=NONE guifg=salmon
" }}}

" Markdown {{{
au BufEnter *.md set tw=80
au BufEnter *.md set filetype=markdown
au BufEnter *.md set syntax=markdown
au BufRead *.md setlocal spell
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

" SuperTab {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}

" TaskWarrior {{{
" " default task report type
" let g:task_report_name     = 'next'
" " custom reports have to be listed explicitly to make them available
" let g:task_report_command  = []
" " whether the field under the cursor is highlighted
" let g:task_highlight_field = 1
" " can not make change to task data when set to 1
" let g:task_readonly        = 0
" " vim built-in term for task undo in gvim
" let g:task_gui_term        = 1
" " allows user to override task configurations. Seperated by space. Defaults to ''
" let g:task_rc_override     = 'rc.defaultwidth=999'
" " default fields to ask when adding a new task
" let g:task_default_prompt  = ['due', 'description']
" " whether the info window is splited vertically
" let g:task_info_vsplit     = 0
" " info window size
" let g:task_info_size       = 15
" " info window position
" let g:task_info_position   = 'belowright'
" " directory to store log files defaults to taskwarrior data.location
" let g:task_log_directory   = '~/.task'
" " max number of historical entries
" let g:task_log_max         = '20'
" " forward arrow shown on statusline
" let g:task_left_arrow      = ' <<'
" " backward arrow ...
" let g:task_left_arrow      = '>> '
" }}}
