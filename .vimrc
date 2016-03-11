if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/vimfiler', {
\   'autoload' : { 'commands' : [ 'VimFiler' ] },
\ }
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'

NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {
  \   'commands' : ['EasyAlign'],
  \   'mappings' : ['<Plug>(EasyAlign)'],
  \ }}

" ブックマークを最初から表示
let g:NERDTreeShowBookmarks=1

" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
 autocmd vimenter * NERDTree|normal gg3j
endif


NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \		 },
      \ }

" for LaTeX
NeoBundle 'lervag/vimtex'

NeoBundle 'thinca/vim-quickrun'

let g:quickrun_config = {
			\   "_" :{
			\         "runner" : "vimproc",
			\         "runner/vimproc/updatetime" : 60
			\         },
			\   "tex" : {
			\       'command' : 'latexmk',
			\       "outputter/buffer/split" : ":botright 8sp",
			\       'outputter/error/error' : 'quickfix',
			\       'hook/cd/directory': '%S:h',
			\       'exec': '%c %s'
			\   },
			\}


" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}

NeoBundle 'fuenor/im_control.vim'

"<C-^>でIM制御が行える場合の設定
let IM_CtrlMode = 4
"ctrl+jで日本語入力固定モードをOnOff
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

"画面上でタブ文字が占める幅
set tabstop=2

"自動インデントでずれる幅
set shiftwidth=2

"改行時に前の行のインデントを継続する
set autoindent

"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

"マウスの入力を受け付ける
set mouse=a

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*


" for LaTeX
NeoBundle 'lervag/vimtex'

" vim-quickrun
NeoBundle 'thinca/vim-quickrun'
" コンパイル時に使用するコマンド
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*' 
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

" ファイルのビューワー
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
let g:tex_flavor='latex'
"行番号表示
set number

" rubyでのみvim-rubyを読み込む
NeoBundleLazy 'vim-ruby/vim-ruby' ,{
\    "autoload" : {"filetypes" : ["ruby"]}
\}
" Ruby向けにendを自動挿入してくれる
NeoBundleLazy 'tpope/vim-endwise' ,{
\    "autoload" : {"filetypes" : ["ruby"]}
\}
"rails
NeoBundle 'tpope/vim-rails'


" Rubyを実行
nnoremap <C-e> :!ruby %
 
nnoremap <C-a> :vsplit
nnoremap <C-t> :tabnew


inoremap <silent> <Esc> <Esc>

inoremap <silent> <C-[> <Esc>


"tex-edit
inoremap \item \begin{itemize}<CR>\item <CR>\end{itemize}<UP>
inoremap \num \begin{enumerate}<CR>\item <CR>\end{enumerate}<UP>
inoremap \se \section{}<LEFT>

" text-edit
inoremap <C-d> <Del>
" brackets"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
inoremap [% [% %]<LEFT><LEFT><LEFT>

set background=dark
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'


call neobundle#end()
" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
