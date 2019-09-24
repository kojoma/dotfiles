#!/usr/bin/env zsh

ansible-playbook local.yml -i hosts --extra-vars "install_mas=yes"
