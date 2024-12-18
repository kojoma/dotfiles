# dotfiles

## Prepare install

```
$ cd ~/
$ mkdir -p Works/github.com/kojoma && cd "$_"

# gitコマンドを実行するためにはコマンドラインツールをインストールする必要がある
$ xcode-select --install

$ git clone https://github.com/kojoma/dotfiles.git
```

## How to install

```
$ cd dotfiles
$ ./install <Brewfile_name>
```

## How to update Brewfile

ファイルは git で管理しているため --force で強制的に上書きしても問題ない。

```
$ brew bundle dump --force <Brewfile_name>
```

## 手動での設定が必要なこと

### shellの切り替え

```
# /bin/zshに変更する
$ chsh
```

### preztoの設定

#### コマンドの実行

https://github.com/sorin-ionescu/prezto#manual にある手順を行う。

#### .zpreztorc の更新

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
- key-bindingsを `vi` に変更
- [Customizing Your Prezto Prompt - Mike Buss](https://mikebuss.com/2014/04/07/customizing-prezto/)を参考にthemeを好きなものに変更する

### GitHub の認証情報をキャッシュする

https://docs.github.com/ja/get-started/getting-started-with-git/caching-your-github-credentials-in-git の手順を Terminal で実行する。

