@echo off
title WINDOWS ULTIMATE JUNK CLEANER
color 0a

echo ===========================================
echo      WINDOWS CLEANUP TOOL v1.0
echo  Removes junk, temp, cache, leftovers
echo ===========================================
echo.

echo [1/12] Cleaning Windows Temp...
del /f /s /q "%windir%\Temp\*" >nul 2>&1
rd /s /q "%windir%\Temp" >nul 2>&1
mkdir "%windir%\Temp" >nul

echo [2/12] Cleaning User Temp...
del /f /s /q "%temp%\*" >nul 2>&1

echo [3/12] Cleaning Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

echo [4/12] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1
mkdir "C:\Windows\SoftwareDistribution" >nul

echo [5/12] Clearing DNS Cache...
ipconfig /flushdns >nul

echo [6/12] Clearing Crash Dumps...
del /f /s /q "C:\Windows\Minidump\*" >nul 2>&1
del /f /s /q "C:\Windows\Memory.dmp" >nul 2>&1

echo [7/12] Cleaning log files...
for /r C:\ %%i in (*.log) do del "%%i" >nul 2>&1

echo [8/12] Cleaning old prefetch files...
del /f /q C:\Windows\Prefetch\*.pf >nul 2>&1

echo [9/12] Clearing Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1

echo [10/12] Cleaning Browser Cache...

:: Chrome
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache" >nul 2>&1

:: Edge
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1

:: Firefox
rd /s /q "%AppData%\Mozilla\Firefox\Profiles\*\cache2" >nul 2>&1

echo [11/12] Removing orphaned Windows Installer files...
del /f /s /q "C:\Windows\Installer\*.tmp" >nul 2>&1
del /f /s /q "C:\Windows\Installer\*.bak" >nul 2>&1

echo [12/12] Removing leftover program folders...
rd /s /q "C:\ProgramData\Package Cache" >nul 2>&1
rd /s /q "%LocalAppData%\CrashDumps" >nul 2>&1
rd /s /q "%LocalAppData%\Temp" >nul 2>&1
mkdir "%LocalAppData%\Temp" >nul

echo.
echo ===========================================
echo   CLEANUP COMPLETE — System is optimized!
echo ===========================================
echo.
pause
