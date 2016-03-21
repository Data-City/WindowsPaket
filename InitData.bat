@echo off
set datacityHome=%~dp0
set mongodbBinHome=%~dp0\bin
set restheartHome=%~dp0\restheart-1.1.3

echo Start mongod...
cd "%mongodbBinHome%" 
start mongod.exe --dbpath %datacityhome%\data\db
ping 127.0.0.1 -n 3 -w 1000 > nul

echo Die DatenBank zu initialisieren
cd "%mongodbBinHome%"
call grunt initDB
pause

echo Die BeispielDatei zu importieren
cd "%mongodbBinHome%"
call grunt import:Beispieldatei.csv:BeispielTest
pause

echo Dummyfile zu erzeugen
cd "%datacityHome%"
fsutil file createnew DBInitialized 1024"
pause