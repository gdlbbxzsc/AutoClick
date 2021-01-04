rem @echo off 
rem 每二十分钟去做一次看广告任务
  
set "douyin_qukanguanggao_param=%1"

if not defined douyin_last_qu_kan_guang_gao_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_qu_kan_guang_gao_time
)  

set "douyin_now_qu_kan_guang_gao_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat douyin_now_qu_kan_guang_gao_time
rem echo now_qu_kan_guang_gao_time:%now_qu_kan_guang_gao_time%

set /a "sec_count=%douyin_now_qu_kan_guang_gao_time%-%douyin_last_qu_kan_guang_gao_time%"
echo 距离上次去看广告时间：%sec_count%

if %sec_count% gtr %douyin_qukanguanggaorenwujiange% (
	echo 可以去看广告
	call :ke_kan_guang_gao
	goto :eof
)
 

rem pause
goto :eof
::====================================

:get_last_qu_kan_guang_gao_time
call utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time
rem echo last_qu_kan_guang_gao_time:%last_qu_kan_guang_gao_time%
goto :eof



:ke_kan_guang_gao  

if %douyin_qukanguanggao_param% equ 1 ( 
	echo 退出直播去开宝箱
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 1 > nul
)

echo 去赚钱页面
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部
call common_huadongdingbu.bat 

echo 滑动到广告按钮
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0

 
echo 点击广告
adb -s %device_name% shell input tap %douyin_tap_go_guang_gao_x% %douyin_tap_go_guang_gao_y%
  
call douyin_kanguanggao.bat 35

call utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time

rem echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
if %douyin_qukanguanggao_param% equ 1 ( 
	echo 回到直播
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

goto :eof

 

 