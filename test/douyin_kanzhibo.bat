@echo off
d:
cd D:\dev\Android\sdk\platform-tools

rem echo 点击直播
adb shell input tap 64 155
ping localhost -n 2 > nul

:yun_xing_ci_shu

set n=  

:hua_dong_ji_shu

goto :start_____qu_hua_dong_san_ci
:end_____qu_hua_dong_san_ci


goto :start_____shou_hong_bao
:end_____shou_hong_bao


if %m% equ 7 ( 
    rem echo 去点宝箱
    goto :start_____qu_bao_xiang
)
:end_____qu_bao_xiang


if %m% leq 10 ( 
    rem echo 再次滑动观看
    goto :yun_xing_ci_shu
)

echo pause
pause 




rem ===去滑动操作 start=================================
:start_____qu_hua_dong_san_ci

set /a n+=1 
rem echo 滑动次数
rem echo %n%
rem echo ----

if %n% leq 3 (

    rem echo 点击 清屏 暂停一秒
    adb shell input tap 562 335
    ping localhost -n 1 > nul 

    rem echo 滑动翻页
    adb shell input swipe 999 900 999 138

    rem echo 暂停 
    ping localhost -n 61 > nul  
    rem echo --------

    goto :hua_dong_ji_shu
) 
 
goto :end_____qu_hua_dong_san_ci
rem ===去滑动操作 end=================================


rem ===收红包操作 start=================================
:start_____shou_hong_bao

if %n% gtr 3 (

    rem echo 点击 清屏 暂停一秒
    adb shell input tap 562 335  
    ping localhost -n 1 > nul 
    
    rem echo 点击
    adb shell input tap 55 369 
    rem echo 点击
    
    ping localhost -n 3 > nul 
    
    rem echo 收下
    adb shell input tap 333 1061  
    
    set /a m+=1 
    rem echo 点击次数
    rem echo %m%
    rem echo --------------------
 
) 
  
goto :end_____shou_hong_bao
rem ===收红包操作 end=================================



rem ===去宝箱操作 start=================================
:start_____qu_bao_xiang

ping localhost -n 2 > nul

rem echo 退出直播
adb shell input keyevent 4

ping localhost -n 4 > nul

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

ping localhost -n 2 > nul

rem echo 点击直播
adb shell input tap 64 155

goto :end_____qu_bao_xiang
rem ===去宝箱操作 end=================================