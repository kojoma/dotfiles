" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"カラーテーマを設定
colorscheme molokai
syntax on

" 行番号を表示
set number

" taglistの設定
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let tlist_php_settings='php;f:function'
let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8/bin/ctags'
set tags+=~/.tags

" tabキーの設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" 自動インデントOFF
set noautoindent

" タイトルをウィンドウ枠に表示
set title

" ルーラーを表示(ステータスバーにカーソル位置を表示)
set ruler

" 入力中のコマンドをステータスに表示する
set showcmd

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" ビープ音を鳴らさない
set vb t_vb=

" ClipBoardの利用
set clipboard&
set clipboard+=unnamed
set clipboard+=autoselect
set clipboard=unnamed

" 最後までサーチすると先頭に戻る
set wrapscan

" 大文字小文字の区別をしない
set ignorecase

" 検索文字列に大文字があった場合に反映
set incsearch

" 検索文字をハイライト
set hlsearch

" 行番号の表示/非表示をマッピング
" (クリップボードが使えないときのコピー用)
nnoremap <silent> non :<C-u>set nonumber<CR>
nnoremap <silent> setn :<C-u>set number<CR>

" マウスを有効に
set mouse=a
set ttymouse=xterm2

" 最後のカーソル位置を記憶する
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
