@echo off
set admintoolHome=%~dp0\admin-tool

echo Die Import Datei muss im \admin-tool Ordner liegen
echo
echo Welche Datei moechte Sie importieren? Bitte geben Sie den Name der csv Datei ein (z.B. Beispieldatei.csv)
set /p ImportDatei= 
echo
echo Geben Sie den gewuenschten Namen des Datensatzes ein (z.B. Testdata)
set /p Collectionsname=
echo
echo Wollen Sie noch die Verbindungsdatei importieren? (j/n)
set /p Antwort=
IF %Antwort%==j GOTO JA
GOTO NEIN

:JA
echo Welche Verbindungsdatei moechten Sie importieren? Bitte geben Sie den Name der csv Datei ein (z.B. Beispieldatei_Verbingdungen.csv)
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
