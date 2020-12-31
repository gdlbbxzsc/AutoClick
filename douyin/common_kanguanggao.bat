rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem 看广告
::============================
 

::============================
 
rem 等待三十秒
ping localhost -n 31 > nul
 
adb shell input keyevent 4

adb shell input keyevent 4