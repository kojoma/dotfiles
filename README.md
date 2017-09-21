# 個人的な開発環境の設定をまとめたリポジトリ

## シェルについて

シェルはzshを使うため、bashのサーバの場合は変更する必要がある。またoh my zshを使うためこれもインストールが必要。

```
# 現在のshellを確認
echo $SHELL
# 使用できるshellを確認
cat /etc/shells
# zsh, oh my zshのインストール
yum install -y zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh
```

## vimとzshの設定

```
cd <path to work directory>
git clone <this repository>
# 各設定ファイルへのシンボリックリンクを作成
ln -snf <path to this repository>/.vimrc ~/.vimrc
ln -snf <path to this repository>/.zshrc ~/.zshrc
ln -snf <path to this repository>/colors ~/.vim/colors
```

## vimプラグイン管理ツールについて

~/.vim/autoloadにファイルを置く。

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

その後、何かのファイルをvimで開いて `:PlugInstall` コマンドを実行。

