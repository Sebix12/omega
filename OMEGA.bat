::main load
@echo off
::call FS file if not exist then create it
if not exist filesystem.bat goto :installfs
:contfscheck
call filesystem.bat checkup
goto :start

:installfs
::powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/omega/main/filesystem.bat', 'filesystem.bat')"
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
call filesystem.bat getbasetools
goto :cdbd

::end of checkup
:mainexec
::import config if exist
if exist config.bat call config.bat
if not exist config.bat :atcconf

:atcconf
echo.
echo Would you like to create a config? (y:n)
set /p tempchoice=">"
if "%tempchoice%" equ "y" goto :cconfig
if "%tempchoice%" equ "n" goto :sconfig

:sconfig
echo Skipping!
echo.
goto :terminal

:cconfig
echo set defloc=%~dp0
echo done!
echo.
goto :terminal

:terminal
pause
exit