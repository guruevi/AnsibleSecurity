@ECHO OFF
rem -u %1\ISDAdmin -p %2
powershell.exe -Command "get-adcomputer -Identity "%1" -properties * | select @{Expression={$_.'ms-Mcs-AdmPwd'}} | Export-Csv -Path pass.csv -NoTypeInformation"
set A=0
for /f  %%A in (pass.csv) do (
   set A=%%A
)
echo %A%
psexec \\%1 -u %1\ISDAdmin -p %A% -s C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
psexec \\%1 -u %1\ISDAdmin -p %A% -s choco feature enable -n allowGlobalConfirmation
psexec \\%1 -u %1\ISDAdmin -p %A% -s C:\ProgramData\chocolatey\bin\choco install powershell4
psexec \\%1 -u %1\ISDAdmin -p %A% -s C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass \\FILES\packages\ConfigureRemotingForAnsible.ps1
rem -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))"
rem psexec \\%1 -u %1\ISDAdmin -p %A% -s winrm.cmd set winrm/config/service/auth @{Basic="false"}
psexec \\%1 -u %1\ISDAdmin -p %A% -s net localgroup Administrators "URMC-SH\ISDG_TechSup_RCBI" /add

