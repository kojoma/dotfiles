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

" tabキーの設定
set tabstop=4
"set autoindent
set expandtab
set shiftwidth=4

" 自動インデントOFF
set noautoindent

" 改行で自動コメントアウトを無効にする
setlocal formatoptions-=r
setlocal formatoptions-=o
autocmd FileType * setlocal formatoptions-=ro

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

" 行番号の表示/非表示をマッピング
" (クリップボードが使えないときのコピー用)
nnoremap <silent> non :<C-u>set nonumber<CR>
nnoremap <silent> setn :<C-u>set number<CR>

" マウスを有効に
set mouse=a
set ttymouse=xterm2

" 検索文字をハイライト
set hlsearch

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

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータスバーを常に表示
set laststatus=2

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

" 行末の無駄なスペースを削除する
autocmd BufWritePre * :%s/\s\+$//ge

" 行末の無駄な改行文字を削除する
autocmd BufWritePre * :%s///ge

" カーソル行をハイライト
set cursorline

" 貼付け時に自動で:set paste
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" ヤンク可能な行数を設定
set viminfo='20,\"1000

" vim-plug setting
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'

" 自動補完
Plug 'Shougo/neocomplete.vim'

" vim から git を便利に
Plug 'https://github.com/tpope/vim-fugitive.git'

" Initialize plugin system
call plug#end()

" neocomplete setting
inoremap <expr><C-i>     neocomplete#complete_common_string()

" 保存時にディレクトリがない場合は作成する
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" 保存時に自動でmix formatする
let g:mix_format_on_save = 1
