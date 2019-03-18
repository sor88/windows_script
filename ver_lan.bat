echo on
cls 

reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName  | find "ProductName" | findstr /i server && call :noconfig || call :config

:noconfig
echo %ProductName%
pause
exit 

:config
@echo AutoConfiguration Lan DHCP Script
netsh interface ip set address name="lan" source=dhcp
ipconfig /flushdns
nbtstat -R
nbtstat -RR
netsh int reset all
netsh int ipv4 reset
netsh int ipv6 reset
netsh winsock reset