#!powershell

#Requires -Module Ansible.ModuleUtils.ArgvParser
#Requires -Module Ansible.ModuleUtils.CommandUtil
#Requires -Module Ansible.ModuleUtils.Legacy

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

Function Get-WinPackage {
    $out = @{}
    # We do this conversion to and from JSON so we lose all the native objects, otherwise we get stuck in some weird race function down further
    $array = Get-ItemProperty -Path "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | ConvertTo-JSON | ConvertFrom-Json
    ForEach ($package in $array) {
        $out.Add($package.PSChildName, $package)
    }
    return $out
}

# Create a new result object
$result = @{
    changed       = $false
    ansible_facts = @{
        packages = @{}
    }
}

$result.ansible_facts.packages = Get-WinPackage

Exit-Json -obj $result