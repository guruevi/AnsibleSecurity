@echo off
echo Enter the computer name or IP you want to connect to
set /P name="Hostname: "

rem Making a backup
copy C:\ProgramData\CrashPlan\.identity C:\ProgramData\CrashPlan\.identity-CPProxy
copy C:\ProgramData\CrashPlan\.ui_info C:\ProgramData\CrashPlan\.ui_info-CPProxy
copy C:\ProgramData\CrashPlan\service.pem C:\ProgramData\CrashPlan\service.pem-CPProxy

rem Copying the necessary files
xcopy \\%name%\C$\ProgramData\CrashPlan\.identity C:\ProgramData\CrashPlan\.identity /Y
xcopy \\%name%\C$\ProgramData\CrashPlan\.ui_info C:\ProgramData\CrashPlan\.ui_info /Y
xcopy \\%name%\C$\ProgramData\CrashPlan\service.pem C:\ProgramData\CrashPlan\service.pem /Y

rem Forward local connection
net stop "Code42 CrashPlan Backup Service"
netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=4244 connectaddress=%name% connectport=9244

rem Accept remote connection
psexec \\%name% netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=9244 connectaddress=127.0.0.1 connectport=4244
psexec \\%name% netsh advfirewall firewall add rule name="CPProxy" dir=in action=allow protocol=TCP localport=9244

rem Run the application locally
"C:\Program Files\CrashPlan\electron\CrashPlanDesktop.exe"

rem Let the user press the any key
echo "Press any key when you are done"
timeout -1
echo "Breaking down the connection"

rem Delete remote connection
psexec \\%name% netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=9244
psexec \\%name% netsh advfirewall firewall delete rule name="CPProxy"

rem Delete local connection
netsh interface portproxy delete v4tov4 listenaddress=127.0.0.1 listenport=4244

rem Restoring the backup
copy C:\ProgramData\CrashPlan\.identity-CPProxy C:\ProgramData\CrashPlan\.identity
copy C:\ProgramData\CrashPlan\.ui_info-CPProxy C:\ProgramData\CrashPlan\.ui_info
copy C:\ProgramData\CrashPlan\service.pem-CPProxy C:\ProgramData\CrashPlan\service.pem