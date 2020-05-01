#!/bin/bash
pip install ansible
pip install pypsexec smbprotocol[kerberos] requests_kerberos
rsync -av ../cmdb_templates/* /usr/local/Cellar/ansible-cmdb/1.30/libexec/ansiblecmdb/data/tpl/
