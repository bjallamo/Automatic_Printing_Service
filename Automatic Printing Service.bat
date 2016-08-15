@echo off
title Automatic Printing Service v0.2 by mforce

set SECONDS=10
set PRINTER_NAME=Microsoft Print to PDF
set READ_DIR=C:\Users\marci\Desktop\READ_DIR
set NEW_DIR=C:\Users\marci\Desktop\NEW_DIR

set TEMP_LIST=%NEW_DIR%\filelist.txt
set FILETYPE=*.jpg


set SCRIPT_NAME=Automatic Printing Service v0.2 by mforce^& echo.
echo %SCRIPT_NAME%
set NEWLINE=^& echo.

if not exist "%NEW_DIR%" (
	echo %NEW_DIR% %NEWLINE%Nem talalhato.%NEWLINE%Add meg a fajlban a szukseges eleresi utvonalat.%NEWLINE%%NEWLINE%
	pause
	exit
)

:start
cls
echo %SCRIPT_NAME%
if not exist "%READ_DIR%" (
	echo Olvasasi mappa nem talalhato.
	goto check
)
cd /D "%READ_DIR%"
dir /b "%FILETYPE%" > "%TEMP_LIST%"
for %%A in ("%TEMP_LIST%") do if not %%~zA==0 goto print_files

:check
choice /C a /T %SECONDS% /D a /M "Azonnali fajl ellenorzes"
IF ERRORLEVEL 1 goto :start

:print_files
echo Fajlokat talaltunk! A fajlok nyomtatas utan at lesznek helyezve.
REM for %%A in ("%FILETYPE%") do MSPAINT /p "%%A"
for %%A in ("%FILETYPE%") do MSPAINT /pt "%%A" "%PRINTER_NAME%"
REM for %%A in ("%FILETYPE%") do rundll32 shimgvw.dll ImageView_PrintTo /pt "%%A" "%PRINTER_NAME%"
move "%FILETYPE%" "%NEW_DIR%"
cls
echo %SCRIPT_NAME%
cd /D "C:\"
choice /C a /T %SECONDS% /D a /M "Lecsatlakoztatas 10mp"
IF ERRORLEVEL 1 goto :start