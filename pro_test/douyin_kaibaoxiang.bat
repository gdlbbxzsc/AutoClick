rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem 从首页去开宝箱


rem echo 去赚钱页面
adb shell input tap 549 1831

ping localhost -n 2 > nul

rem echo 点击宝箱
adb shell input tap 922 1746

ping localhost -n 2 > nul

rem echo 关闭宝箱
adb shell input tap 546 1374

ping localhost -n 1 > nul

rem echo 退出去赚钱页面
adb shell input keyevent 4