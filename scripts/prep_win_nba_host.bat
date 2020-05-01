rem set loginseq=-u %1\nba_admin -p !RoR.tLA.eX8
rem set loginseq=
rem psexec \\%1 %loginseq% -s reg import \\NSC-TESTWIN10\packages\TLSv11-Win7.reg
rem psexec \\%1 %loginseq% -s reg import \\NSC-TESTWIN10\packages\TLSv12-Win7.reg
psexec \\%1 %loginseq% -s powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
psexec \\%1 %loginseq% -s choco feature enable -n allowGlobalConfirmation
psexec \\%1 %loginseq% -s C:\ProgramData\chocolatey\bin\choco install powershell4
rem psexec \\%1 %loginseq% -s winrm.cmd delete winrm/config/Listener?Address=*+Transport=HTTP
rem psexec \\%1 %loginseq% -s winrm.cmd delete winrm/config/Listener?Address=*+Transport=HTTPS
psexec \\%1 %loginseq% -s C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass \\FILES\packages\ConfigureRemotingForAnsible.ps1
psexec \\%1 %loginseq% -s winrm.cmd set winrm/config/service/auth @{Basic="false"}
rem psexec \\%1 %loginseq% -s sc stop winrm
rem psexec \\%1 %loginseq% -s sc start winrm
rem psexec \\%1 %loginseq% -s net localgroup Administrators "URMC-SH\ISDG_NeuroAna_ITSupport" /add
rem psexec \\%1 %loginseq% -s net localgroup Administrators "URMC-SH\ISDG_TechSup_RCBI" /add

