@echo off
:: Function
set "ggreen=[92m"
set "rred=[91m"
set "n=&"
set "rarrow=>"
set "ttxtend=[0m"
cd "%localappdata%\temp\ROTWETemp"
timeout /t 1 /nobreak>nul
echo ms = WScript.Arguments(0) > sleep.vbs
echo WScript.Sleep ms >> sleep.vbs
timeout /t 1 /nobreak>nul
:: --------------------------------

