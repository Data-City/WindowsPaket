@echo off
set admintoolHome=%~dp0\admin-tool
set mongodbBinHome=%~dp0\bin
set datacityHome=%~dp0

echo Die Import Datei muss im \admin-tool Ordner liegen
echo Start mongod...
cd "%mongodbBinHome%" 
start mongod.exe --dbpath %datacityhome%\data\db
ping 127.0.0.1 -n 3 -w 1000 > nul

echo Welche Datei moechten Sie importieren? Bitte geben Sie den Name der csv Datei ein (z.B. Beispieldatei.csv)
set /p ImportDatei= 
echo Geben Sie den gewuenschten Namen des Datensatzes ein (z.B. Testdata)
set /p Collectionsname=
echo Wollen Sie noch die Verbindungsdatei importieren? (j/n)
set /p Antwort=
IF %Antwort%==j GOTO JA
GOTO NEIN

:JA
echo Welche Verbindungsdatei moechten Sie importieren? Bitte geben Sie den Name der csv Datei ein (z.B. Beispieldatei_Verbindungen.csv)
set /p Verbindungsdatei=

echo Die Datei wird importiert...
cd "%admintoolHome%"
call grunt import:%ImportDatei%:%Collectionsname%:%Verbindungsdatei%
goto END

:NEIN
echo Die Datei zu importieren
cd "%admintoolHome%"
call grunt import:%ImportDatei%:%Collectionsname%
goto END

:END
pause
