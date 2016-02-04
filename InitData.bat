@echo off
set datacityHome=%~dp0
set admintoolHome=%~dp0\admin-tool
set mongodbBinHome=%~dp0\bin
set restheartHome=%~dp0\restheart-1.1.3

echo Start mongod...
cd "%mongodbBinHome%" 
start mongod.exe --dbpath %datacityhome%\data\db
ping 127.0.0.1 -n 3 -w 1000 > nul

echo Start mongo... um die admin Datenbank inkl. Benutzername und Passwort und die ansichten Collection in einstelllungen Datenbank zu erzeugen
cd "%mongodbBinHome%"
start mongo.exe
call "%datacityHome%\dropDatabase.vbs"
call "%datacityHome%\createCollection.vbs"
ping 127.0.0.1 -n 8 -w 1000 > nul

echo Die BeispielDatei zu importieren
cd "%admintoolHome%"
call grunt import:Beispieldatei.csv:LokalTest:Beispieldatei_Verbindungen.csv
pause

echo Dummyfile zu erzeugen
cd "%datacityHome%"
fsutil file createnew DBInitialized 1024"
pause