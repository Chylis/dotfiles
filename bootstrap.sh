#!/bin/bash

#Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ; \
brew update ; \

#Install ansible
brew install ansible ; \

#Run ansible using the inventory file located at 'ansible/inventory'
ansible-playbook -i ansible/inventory ansible/setup-dotfiles.yaml --extra-vars "dotfilespath=`pwd`"
