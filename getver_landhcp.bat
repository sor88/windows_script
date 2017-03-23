echo off 
cls 

reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName  | find "ProductName" | findstr /i server && call :noconfig || call :config

:noconfig
echo %ProductName%
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
