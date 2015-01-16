## 個人的な開発環境の設定をまとめたリポジトリ  

###開発環境を作る方法
自分のホームディレクトリでこのリポジトリをclone  
設定ファイルへのシンボリックリンクを作成  
  ls -s ~/mysettings/.vimrc ~/.vimrc  
あとは更新されたらリポジトリをpull  
  
###vimのカラーテーマmolokaiインストール方法
カラーテーマのmolokaiはデフォルトでは入ってないので下記URLからダウンロードしてくる必要あり  
http://www.vim.org/scripts/script.php?script_id=2340  
そして下記コマンドを実行  
mkdir -p ~/.vim/colors  
mv ~/molokai.vim ~/.vim/colors/molokai.vim  
  
###Vundle/NeoBundleのインストール  
便利なプラグインを使うにはVundle/NeoBundleをインストールする必要があり  
下記コマンドを実行する  
mkdir -p ~/.vim/bundle  
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc  

