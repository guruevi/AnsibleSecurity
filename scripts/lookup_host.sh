#!/bin/bash

DC=$(nslookup -type=any _ldap._tcp.urmc-sh.rochester.edu | grep _ldap._tcp | awk '{print $7}' | head -n 1)

hosts=$(ldapsearch -H ldap://"${DC}" -b "OU=URMC,DC=urmc-sh,DC=rochester,DC=edu" "(&(objectCategory=Computer)(name=$1))" 2>/dev/null | $(dirname "${BASH_SOURCE[0]}")/ldif2json)
echo "${hosts}"
