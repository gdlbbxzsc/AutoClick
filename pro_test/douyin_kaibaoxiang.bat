rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem 从首页去开宝箱
::============================
rem 点击去赚钱 x y
set "tap_go_zhuan_qian_x=549"
set "tap_go_zhuan_qian_y=1831"

rem 点击宝箱 x y
set "tap_go_bao_xiang_x=922"
set "tap_go_bao_xiang_y=1746"
rem 关闭宝箱 x y
set "tap_close_bao_xiang_x=546"
set "tap_close_bao_xiang_y=1374"

::============================
rem echo 去赚钱页面
adb shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

adb shell input swipe %swipe_v_zhi_bo_x% %swipe_v_zhi_bo_y1% %swipe_v_zhi_bo_x% %swipe_v_zhi_bo_y2% & ping localhost -n 30 > nul  

rem echo 点击宝箱
adb shell input tap %tap_go_bao_xiang_x% %tap_go_bao_xiang_y%

ping localhost -n 2 > nul

rem echo 关闭宝箱
adb shell input tap %tap_close_bao_xiang_x% %tap_close_bao_xiang_y%

ping localhost -n 1 > nul

rem echo 退出去赚钱页面
adb shell input keyevent 4