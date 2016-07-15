#!/bin/bash

#Run ansible using the inventory file located at 'ansible/inventory'
ansible-playbook --ask-become-pass -i ansible/inventory ansible/setup-dotfiles.yaml --extra-vars "dotfilespath=`pwd`"
