@echo off
set mongodbBinHome=%~dp0\bin
set datacityHome=%~dp0

echo Start mongod...
cd "%mongodbBinHome%"
start mongod.exe --dbpath %datacityhome%\data\db
