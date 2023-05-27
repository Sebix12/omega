::main load
@echo off
set defloc=%~dp0
::call FS file if not exist then create it
if not exist filesystem.bat goto :installfs
:contfscheck
call filesystem.bat checkup
goto :start

:installfs
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/omega/main/filesystem.bat', 'filesystem.bat')"
echo $info-    Installed filesystem.bat
goto :contfscheck

::folders check
:start
if not exist bin goto :cbin
:cbind
if not exist db goto :cdb
:cdbd
goto :mainexec

:cbin
call filesystem.bat mkdir bin
goto :cbind

:cdb
call filesystem.bat mkdir db
cd db
call %defloc%filesystem.bat getbasetools
cd..
goto :cdbd

::end of checkup
:mainexec
::import config if exist
if exist config.bat goto :confexst
if not exist config.bat goto :atcconf

:atcconf
echo.
echo Would you like to create a config? (y:n)
set /p tempchoice=">"
if "%tempchoice%" equ "y" goto :cconfig
if "%tempchoice%" equ "n" goto :sconfig

:sconfig
set tempchoice=
echo Skipping!
echo.
goto :terminal

:cconfig
set tempchoice=
echo set defloc=%~dp0 >> config.bat
echo done!
echo.
goto :mainexec

:confexst
echo loading config!
call config.bat
goto :terminal

:terminal
set /p terminal=">"
goto :execcommand

:execcommand
if "%terminal%" equ "fs" goto :fsexeccmd && goto :terminal
if "%terminal%" equ "exit" exit && goto :terminal
if "%terminal%" equ "help" type help.db && goto :terminal
::try DataBase
cd db
call decryptorb8.bat %terminal%
::end databasecode
goto :terminal

:fsexeccmd
echo Select command for FS exec
set /p tempchoice=$FS">
echo Select subvalue for FS exec (if needed)
set /p fssubvar=$FS/subvar">
call filesystem.bat %tempchoice% %fssubvar%
goto :terminal