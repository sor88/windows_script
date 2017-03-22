echo off 
cls 
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName ^| find "ProductName"') do set ProductName=%%b 

if "%ProductName%" == "Windows Server 2008 R2 Datacenter" goto noconfig
if "%ProductName%" == "Windows Server 2008 R2 Enterprise" goto noconfig
if "%ProductName%" == "Windows Server 2008 R2 Standard" goto noconfig
if "%ProductName%" == "Microsoft Windows Server 2003" goto noconfig
if "%ProductName%" == "Microsoft Windows XP" goto config 
if "%ProductName%" == "Windows 7 Ultimate" goto config
if "%ProductName%" == "Windows 7 Enterprise" goto config
if "%ProductName%" == "Windows 7 Professional" goto config
if "%ProductName%" == "Windows 7 Home Premium" goto config
if "%ProductName%" == "Windows 7 Home Basic" goto config
if "%ProductName%" == "Windows 7 Starter" goto config


:noconfig
exit 

:config 
@echo AutoConfiguration Lan DHCP Script
ipconfig /flashdns
nbtstat -R
nbtstat -RR

netsh winsock reset
netsh int reset all
netsh int ip reset
netsh interface reset all
ipconfig /renew 
netsh interface ip set address name="Подключение по локальной сети" source=dhcp 
netsh interface ip set dns "Подключение по локальной сети" source=dhcp register=PRIMARY  
ipconfig /renew 
exit
