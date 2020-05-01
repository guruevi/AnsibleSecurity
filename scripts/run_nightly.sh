#!/bin/bash
kinit -k -t ~/keytabs/evanoost.keytab 
ansible-playbook all_windows.yml --limit @all_windows.retry > output_win.txt 2>&1
ansible-playbook all_mac.yml --limit @all_mac.retry > output_mac.txt 2>&1
ansible-playbook all_linux.yml --limit @all_linux.retry > output_lin.txt 2>&1 
./discover_hosts.sh
