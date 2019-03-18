@ECHO OFF
@ECHO ON
set dir=%\\192.168.41.100\it\cryptopro\
rem @cls
@ECHO ON


@If exist "%programfiles(x86)%" (
@echo Update CryptoPro to v4.x x64 : CryptoPro x64
@"%dir%csp-x64-kc2-rus.msi" /quiet 
PIDKEY=4040C-Y0000-01GYP-9HRC1-4FZNT
@echo Done!
) else (
@echo Update CryptoPro to v4.x x32 : CryptoPro x32
@"%dir%csp-win32-kc2-rus.msi" /quiet 
PIDKEY=4040C-Y0000-01GYP-9HRC1-4FZNT
@echo Done!
)
