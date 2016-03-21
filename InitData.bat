@echo off
set datacityHome=%~dp0
set admintoolHome=%~dp0\admin-tool
set mongodbBinHome=%~dp0\bin
set restheartHome=%~dp0\restheart-1.1.3

echo Start mongod...
cd "%mongodbBinHome%" 
start mongod.exe --dbpath %datacityhome%\data\db
ping 127.0.0.1 -n 3 -w 1000 > nul

echo Die DatenBank zu initialisieren
cd "%admintoolHome%"
call grunt initDB
pause

echo Die BeispielDatei zu importieren
cd "%admintoolHome%"
call grunt import:Beispieldatei.csv:BeispielTest
pause

echo Dummyfile zu erzeugen
cd "%datacityHome%"
fsutil file createnew DBInitialized 1024"
pause