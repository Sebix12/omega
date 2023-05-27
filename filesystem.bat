@echo off
if "%1" equ "checkup" echo $info-    filesystem.bat is ok!
if "%1" equ "mkdir" goto :mkdir
if "%1" equ "rmdir" goto :rmdir
goto :ext

:mkdir
mkdir %2
echo $info-    Created folder %2
goto :ext

:rmdir
rmdir %2
echo $info-    Deleted folder %2
goto :ext

:ext