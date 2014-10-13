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

" カラーテーマを設定
colorscheme molokai
syntax on

" 行番号を表示
set number

" taglistの設定
let Tlist_Show_One_File = 1  			" 開いているファイルのtagのみ表示する
let Tlist_Use_Right_Window = 1			" 右側にtaglistを表示する
let Tlist_Exit_OnlyWindow = 1			" 開いているファイルがtaglistのみになったら終了する
let tlist_php_settings='php;f:function'		" functionのみ表示する
set tags+=~/.tags				" 読み込むtagsファイルの場所

