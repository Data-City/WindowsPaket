@echo off
set datacityHome=%~dp0
set admintoolHome=%~dp0\admin-tool
set mongodbBinHome=%~dp0\bin
set restheartHome=%~dp0\restheart-1.1.3

echo Umwelt MongoDB einzustellen
md %datacityhome%\data\db
ping 127.0.0.1 -n 3 -w 1000 > nul

echo alle Node-Abhaengigkeiten fuer admin-tool zu installieren
cd "%admintoolHome%" 
npm install
pause

