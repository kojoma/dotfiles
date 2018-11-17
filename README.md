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
