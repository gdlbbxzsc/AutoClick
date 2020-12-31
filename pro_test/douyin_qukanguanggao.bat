rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem 从首页去看广告
::============================
rem 点击去赚钱 x y
set "tap_go_zhuan_qian_x=549"
set "tap_go_zhuan_qian_y=1831"

rem 滑动到广告按钮 x y
set "swipe_to_guanggao_x=333"
set "swipe_to_guanggao_y1=1000" 
set "swipe_to_guanggao_y2=0" 

rem 点击广告 x y
set "tap_go_guang_gao_x=891"
set "tap_go_guang_gao_y=1427"

 
::============================
rem echo 去赚钱页面
adb shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

将去赚钱滑动到顶部
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  

rem echo 滑动到广告按钮
adb shell input swipe %swipe_to_guanggao_x% %swipe_to_guanggao_y1% %swipe_to_guanggao_x% %swipe_to_guanggao_y2% 

 
rem echo 点击广告
adb shell input tap %tap_go_guang_gao_x% %tap_go_guang_gao_y%
 

rem echo 退出去赚钱页面
adb shell input keyevent 4