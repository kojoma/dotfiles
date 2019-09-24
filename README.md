# Provisioning Mac By Ansible

[![CircleCI](https://circleci.com/gh/kojoma/my-settings.svg?style=svg)](https://circleci.com/gh/kojoma/my-settings)

## 手動での準備

Ansibleを実行するための準備。必要であれば行う。

```
$ cd ~/
$ mkdir Works
$ cd Works

# gitコマンドを実行するためにはコマンドラインツールをインストールする必要がある
$ xcode-select --install

$ git clone https://github.com/kojoma/my-settings.git

# See https://brew.sh/ and install Homebrew

# Install Ansible
brew install ansible
```

## Ansible Playbookの実行

```
$ cd my-settings
$ bin/setup.sh

# Mas でアプリケーションもインストールする場合
$ bin/setup-with-mas.sh
```

## 手動での設定が必要なこと

### shellの切り替え

```
# /bin/zshに変更する
$ chsh
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
- [Customizing Your Prezto Prompt - Mike Buss](https://mikebuss.com/2014/04/07/customizing-prezto/)を参考にthemeを好きなものに変更する

### Ruby Gems

[Ansible gem module](https://docs.ansible.com/ansible/2.5/modules/gem_module.html)を利用して、インストールできそうだったがインストールしたはずのgemコマンドが利用できない問題があったためひとまず未対応。詳細は[このPull Request](https://github.com/kojoma/my-settings/pull/14)に記述している。
