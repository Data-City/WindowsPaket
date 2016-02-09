@echo off
set datacityHome=%~dp0
set admintoolHome=%~dp0\admin-tool
set mongodbBinHome=%~dp0\bin
set restheartHome=%~dp0\restheart-1.1.3


echo Alle Node-Abhaengigkeiten fuer das Admin-tool werden installiert...
cd "%admintoolHome%" 
npm install
pause

