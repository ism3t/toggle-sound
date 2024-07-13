:: ToggleSound.cmd
color c
set "NC="
::check nircmd (adjust your path accordingly)
for /f "delims=" %%A in ("nircmd.exe") do Set "NC=C:\toggle-sound\nircmd.exe"
if Not defined NC (Echo Can't Locate nircmd.exe&Pause&Exit /B 1)
Set "Ini=%~dpn0.Ini"

If Not Exist "%Ini%" goto :Speakers
:: get current selection
For /f "tokens=1,2 delims==" %%A in ('Findstr /i "Active" %Ini%') Do Set "Active=%%B"
if /I "%Active%"=="Headset" goto :Speakers

:: switch to Headset (change "HeadsetName" to your headset name)
%nc% setdefaultsounddevice "HeadsetName" 1
%nc% inisetval "%Ini%" DefaultSoundDevice Active Headset
echo Switched to Headset &Exit
goto :Eof
:: switch to Speakers (change "SpeakerName" to your speaker name)

:Speakers
%nc% setDefaultSoundDevice "SpeakerName" 1
%nc% inisetval "%Ini%" DefaultSoundDevice Active Speakers
echo Switched to Speakers &Exit
goto :Eof