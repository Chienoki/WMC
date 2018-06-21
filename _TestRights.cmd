@echo off
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || (
echo ============================================================
echo ERROR: Run the script as administrator.
echo ============================================================
echo.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)
%windir%\system32\reg.exe query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v PROCESSOR_ARCHITECTURE | find /i "amd64" 1>nul || (
echo ============================================================
echo ERROR: This script is for 64-bit systems.
echo ============================================================
echo.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)
cd /d "%~dp0"
bin\NSudoC.exe -U:T -P:E cmd
