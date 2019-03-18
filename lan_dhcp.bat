@ECHO OFF
@ECHO ON
@cls
@ECHO ON

@echo AutoConfiguration Lan DHCP Script
ipconfig /flashdns
nbtstat -R
nbtstat -RR

netsh winsock reset
netsh int reset all
netsh int ip reset
netsh interface reset all
ipconfig /renew 