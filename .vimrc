"---------------------------
"" Start Neobundle Settings.
"---------------------------

syntax on
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'ujihisa/unite-colorscheme'

" Color Scheme jellybeans
NeoBundle 'nanotech/jellybeans.vim'
colorscheme jellybeans

NeoBundle 'vim-ruby/vim-ruby'

filetype plugin indent on

if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
else
  set t_Co=16
endif

"-------------------------
"" End Neobundle Settings.
"-------------------------
