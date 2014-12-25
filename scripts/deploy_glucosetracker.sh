#!/bin/bash

ansible-playbook -i www.glucosetracker.net, ../production.yml --tags="deploy" --ask-vault-pass
