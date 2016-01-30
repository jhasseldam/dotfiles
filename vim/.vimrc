" Kuznero Profile Include {{{1
let s:rc = expand( "$HOME/.kuvimrc" )
if filereadable( s:rc )
  execute ':source '.s:rc
endif

