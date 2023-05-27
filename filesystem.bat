@echo off
if "%1" equ "checkup" echo $info-    filesystem.bat is ok!
if "%1" equ "mkdir" goto :mkdir
if "%1" equ "rmdir" goto :rmdir
if "%1" equ "getbasetools" goto :gettools
goto :ext

:mkdir
mkdir %2
echo $info-    Created folder %2
goto :ext

:rmdir
rmdir %2
echo $info-    Deleted folder %2
goto :ext

:gettools
cd db
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/omega/main/db.zip', 'tools.zip')"
echo $info-    Downloaded Tar zip
tar -xf tools.zip
del tools.zip
cd ..
goto :ext

:ext