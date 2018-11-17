# Provisioning Mac By Ansible

## 手動での準備

Ansibleを実行するための準備。必要であれば行う。

```
$ cd ~/
$ mkdir -p Works/git
$ cd Works/git

# gitコマンドを実行するためにはコマンドラインツールをインストールする必要がある
$ xcode-select --install

$ git clone https://github.com/kojoma/my-settings.git

# Install Homebrew
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Ansible
brew install ansible
```

## Ansible Playbookの実行

```
$ cd my-settings
$ ansible-playbook local.yml -i hosts

# Masでアプリケーションをインストールする場合、extra-varsで指定する
$ ansible-playbook local.yml -i hosts --extra-vars "install_mas=yes"
```

## 手動での設定が必要なこと

### shellの切り替え

```
# /bin/zshに変更する
$ chzh
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
- key-bindingsを `vi` に変更
