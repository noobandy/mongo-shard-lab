@echo off
:: stop all mongos
taskkill /f /im mongos.exe
:: stop all mongod
taskkill /f /im mongod.exe

:: delete data
del /f /s /q data 1>nul
rmdir /s /q data