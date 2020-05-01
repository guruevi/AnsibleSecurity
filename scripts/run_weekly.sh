#!/bin/bash
kinit -k -t ~/keytabs/evanoost.keytab 
ansible-playbook all_windows.yml > output_win.txt 2>&1
ansible-playbook all_mac.yml > output_mac.txt 2>&1
ansible-playbook all_linux.yml > output_lin.txt 2>&1 
./discover_hosts.sh
