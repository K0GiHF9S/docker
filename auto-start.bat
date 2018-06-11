@echo off
:LOOP
    docker info && goto :NEXT
    timeout 1 /nobreak >nul
goto :LOOP

:NEXT
call all-stop.bat
call all-start.bat
exit