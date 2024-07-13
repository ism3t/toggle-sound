@echo off
color 5
setlocal

:: Path to nircmd.exe
set "NC=C:\toggle-sound\nircmd.exe"

:: Check if nircmd.exe exists
if not exist "%NC%" (
    echo Can't locate nircmd.exe at "%NC%"
    pause
    exit /b 1
)

:: Path to the ini file (same as the script but with .ini extension)
set "Ini=%~dpn0.ini"

:: Check if ini file exists, if not, switch to Speakers
if not exist "%Ini%" goto :Speakers

:: Get current selection from ini file
for /f "tokens=1,2 delims==" %%A in ('findstr /i "Active" "%Ini%"') do set "Active=%%B"

:: If current selection is Headset, switch to Speakers
if /i "%Active%"=="Headset" goto :Speakers

:: Switch to Headset (change "HeadsetName" to your headset name)
%NC% setdefaultsounddevice "HeadsetName" 1
%NC% inisetval "%Ini%" DefaultSoundDevice Active Headset
echo Switched to Headset
exit /b 0

:Speakers
:: Switch to Speakers (change "SpeakerName" to your speaker name)
%NC% setdefaultsounddevice "SpeakerName" 1
%NC% inisetval "%Ini%" DefaultSoundDevice Active Speakers
echo Switched to Speakers
exit /b 0
