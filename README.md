# AnsibleSecurity
Automated security and patching of Windows/Mac/Linux using Ansible

This is just a patchwork of Ansible playbooks and scripts to automatically manage Windows, Mac and Linux workstations/desktops across a network without SCCM.

Take it as a base for your environment, your environment probably looks different.

The goal is to automatically patch vulnerabilities, cleanup old software and do some state management. Private information (eg. computer names and administrator
rights) has not been committed to this repo, those files are in .gitignore and should be reconstructed according to your own environment anyway.

Don't just run this repo, it will (probably) wreck your infrastructure. Read what each playbook is doing first.
