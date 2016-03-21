@echo off 
if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit 
:begin 
::
set restheartHome=%~dp0\restheart-1.1.3
set mongodbBinHome=%~dp0\bin
set datacityHome=%~dp0


echo Ueberpruefen, ob ansichten Collection in einstellungen ansichten schon erstellt wurde
IF EXIST "%datacityHome%\DBInitialized" GOTO JA
GOTO NEIN


:JA
echo Start mongod...
cd "%mongodbBinHome%"
start mongod.exe --dbpath %datacityhome%\data\db
ping 127.0.0.1 -n 3 -w 1000 > nul

echo Start RESTHeart... 
start java -jar "%restheartHome%\restheart.jar" "%restheartHome%\etc\restheart.yml"
ping 127.0.0.1 -n 3 -w 1000 > nul

echo Start Webseite...
start http://localhost:8080/datacity

echo Start grunt watch...
cd "%mongodbBinHome%"
start /b grunt watch
ping 127.0.0.1 -n 3 -w 1000 > nul

goto END

:NEIN
echo Initialisierung der DB
call InitData.bat

goto JA

:END
pause
