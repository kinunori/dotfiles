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

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-L> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" " ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" Unite -auto-preview colorscheme で利用
" カラースキーマをレビューできる
NeoBundle 'ujihisa/unite-colorscheme'

" snippet
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" neosnippet用設定
" Plugin key-mappings.
" c-kにするとChefDictと重複して使えないのでc-jに変更
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>" 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" MultipleCursorsFindで利用
" http://qiita.com/sachin21/items/cfcb81bf4d1073429b68
NeoBundle 'terryma/vim-multiple-cursors'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

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

" load_or remove chef_dict
command ChefDicAdd set dictionary+=~/.vim/dict/opscode_chef.dict/*.dict
command ChefDicRem set dictionary-=~/.vim/dict/opscode_chef.dict/*.dict

"-------------------------
"" End Neobundle Settings.
"-------------------------
