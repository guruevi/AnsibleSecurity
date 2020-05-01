set list=(tortoisesvn vmware-tools chocolatey-windowsupdate.extension chocolatey.server adobeair adobereader conemu sysinternals 7zip.install wget devcon.portable dotnet4.6.1 box-drive dotnet4.5 dotnet4.6 powershell powershell4 docker docker-cli docker-desktop boxsync dellcommandupdate googlechrome git firefox firefoxesr itunes thunderbird flashplayerplugin flashplayeractivex foxitreader winscp winscp.install vlc virtualbox putty putty.portable puppet-agent adoptopenjdk8jre adoptopenjdk8 zoom ghostscript ghostscript.app 7zip chocolatey chocolatey-core.extension)
cd ..\packages
for %%a in %list% do ( 
  wget --content-disposition -N https://chocolatey.org/api/v2/package/%%a
  PING localhost -n 60 >NUL
)

for /r %%f IN (.\*.nupkg) DO (
choco push %%f --source="http://nba-retrospect.urmc-sh.rochester.edu" --force --api-key 76E848FD59289C288535ED955E392B3F46060B4D
)
