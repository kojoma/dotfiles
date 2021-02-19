#!/usr/bin/env zsh

ansible-galaxy collection install -r requirements.yml
ansible-playbook local.yml -i hosts
