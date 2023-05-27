::main load
@echo off
::call FS file if not exist then create it
if not exist filesystem.bat goto :installfs
:contfscheck
call filesystem.bat checkup
goto :start

:installfs
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Sebix12/omega/main/filesystem.bat', 'filesystem.bat')"
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
goto :cdbd

::end of checkup
:mainexec
