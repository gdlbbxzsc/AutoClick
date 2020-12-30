@echo off
d:
cd D:\dev\Android\sdk\platform-tools
 
:chong_xin_kai_shi
set m=

:xun_huan_hua_dong

rem echo 滑动翻页 
adb shell input swipe 999 900 999 138  

set /a m+=1
rem echo 滑动翻页次数
rem echo %n%

rem echo 暂停10秒
rem TIMEOUT /T 15
ping localhost -n 10 > nul 
rem echo ---

if %m% geq 120 ( 
    goto :qu_bao_xiang
)

goto :xun_huan_hua_dong
 
rem echo pause
pause 

:qu_bao_xiang

rem echo 去赚钱
adb shell input tap 549 1831

ping localhost -n 4 > nul

rem echo 点击宝箱
adb shell input tap 922 1746

ping localhost -n 3 > nul

rem echo 关闭宝箱
adb shell input tap 546 1374

ping localhost -n 2 > nul

rem echo 退出去赚钱
adb shell input keyevent 4

rem echo ----------------------

goto :chong_xin_kai_shi








