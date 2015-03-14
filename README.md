## 個人的な開発環境の設定をまとめたリポジトリ  

###開発環境を作る方法
自分のホームディレクトリでこのリポジトリをclone  
設定ファイルへのシンボリックリンクを作成  
  ln -s ~/mysettings/.vimrc ~/.vimrc  
  ln -s ~/mysettings/.zshrc ~/.zshrc  
  ln -s ~/mysettings/colors ~/.vim/colors  
あとは更新されたらリポジトリをpull  
  
###Vundle/NeoBundleのインストール  
便利なプラグインを使うにはVundle/NeoBundleをインストールする必要があり  
下記コマンドを実行する  
  mkdir -p ~/.vim/bundle  
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  
  git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc  

