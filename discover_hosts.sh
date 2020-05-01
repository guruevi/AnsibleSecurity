#!/bin/bash
if [ "$1" ]; then
  ansible -m setup --tree out/ "$1"
fi
kinit -k -t ~/keytabs/evanoost.keytab
ansible-cmdb -t html_fancy_split -f ./cache -i ./hosts -C cmdb_templates/custom_cols.conf
