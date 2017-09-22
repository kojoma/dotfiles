# 個人的な開発環境の設定をまとめたリポジトリ

## シェルをzshにする

シェルはzshを使うため、bashのサーバの場合は変更する必要がある。

```
# 現在のshellを確認
echo $SHELL
# 使用できるshellを確認
cat /etc/shells
# 必要があればzshをインストール
sudo yum install -y zsh
chsh
```

## zshの設定

zshの設定にはpreztoを使う。

### preztoのインストール

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# 初期設定のファイルを設置
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

### preztoの設定

`~/.zpreztorc` を開き、下記を変更する

- pmoduleに下記を追加
  - `git`
    - プロンプトにgit情報を表示したりするプラグイン
  - `syntax-highlighting`
    - コマンドのsyntax highlightをするプラグイン
  - `history-substring-search`
    - 履歴からのコマンド実行を便利にするプラグイン
- module用の設定を追記
  - `zstyle ':prezto:module:syntax-highlighting' color 'yes'`
  - `zstyle ':prezto:module:history-substring-search' case-sensitive 'yes'`
  - 詳細は公式のREADMEを参照
- key-bindings を `vi` に変更
- themeを `paradox` に変更

### iTerm2向けの設定

iTerm2の場合、paradox themeを使うとプロンプトが一部文字化けする。これを解決するため下記を行う。

```
# Ricty for Powerlineのパッチをあてる
brew tap sanemat/font
brew reinstall --powerline --vim-powerline ricty
# インストールしたRictyのバージョンを確認
ls -l /usr/local/Cellar/ricty/
cp -f /usr/local/Cellar/ricty/<確認したバージョン>/share/fonts/Ricty*.ttf ~/Library/Fonts/
```

その後、PreferencesのProfilesタブを開き下記を行う。

- Text
  - `Use a different font for non-ASCII text` のチェックをOFF
  - Fontで `Ricty for Powerline` を選択
    - フォントサイズも好みの大きさに変える
- Colors
  - Color Presetsを好みのものに変える

### .zshrcの設定

.zshrcはこのリポジトリでは管理していないため、.zshrcを開き末尾に下記を追記する。
管理方法は別途検討する。

```
# cdしたらlsする
function chpwd() { ls -GAF }
```

## vimの設定

```
cd <path to work directory>
git clone <this repository>
# 各設定ファイルへのシンボリックリンクを作成
ln -snf <path to this repository>/.vimrc ~/.vimrc
ln -snf <path to this repository>/colors ~/.vim/colors
```

## vimプラグイン管理ツールについて

~/.vim/autoloadにファイルを置く。

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

その後、何かのファイルをvimで開いて `:PlugInstall` コマンドを実行。

