@ECHO OFF
@ECHO ON
set dir=%\\192.168.41.100\it\
rem @cls
@ECHO ON

@If exist "%programfiles%/TightVNC" (
@echo Done!

) else (

@If exist "%programfiles(x86)%" (
@echo Installing: ThinVNC x 64
rem @xcopy "%dir%*.msi*" "%temp%/*.msi" /q /y /c
@"%dir%tightvnc-2.8.5-gpl-setup-64bit.msi" /quiet
) else (

@echo Installing: ThinVNC x 32
@"%dir%tightvnc-2.8.5-gpl-setup-32bit.msi" /quiet
)
reg.exe import "%dir%vnc7-8.reg"
@echo Done!
)