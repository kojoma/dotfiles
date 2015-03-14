## 個人的な開発環境の設定をまとめたリポジトリ  
  
###シェルについて
以下はzshを使ってる前提  
ec2とかのデフォルトはbashなので変更すること  
oh-my-zshも入れる  
  yum install zsh  
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh  
  chsh  
  
###vimとzshの設定
自分のホームディレクトリでこのリポジトリをclone  
設定ファイルへのシンボリックリンクを作成  
  ln -s ~/mysettings/.vimrc ~/.vimrc  
  ln -s ~/mysettings/.zshrc ~/.zshrc  
  ln -s ~/mysettings/colors ~/.vim/colors  
あとは更新されたらリポジトリをpull  
  
###Vundle/NeoBundleのインストール  
便利なプラグインを使うにはVundle/NeoBundleをインストール  
  mkdir -p ~/.vim/bundle  
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  
  git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc  

