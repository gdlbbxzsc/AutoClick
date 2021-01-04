rem @echo off 
rem 判断是否可以开宝箱 条件 从打开程序开始每隔二十分钟打开一次宝箱
   
set "kaibaoxiang_param=%1"

if not defined last_kai_bao_xiang_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_bao_xiang_time
)  

set "now_kai_bao_xiang_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_bao_xiang_time
rem echo now_kai_bao_xiang_time:%now_kai_bao_xiang_time%


set /a "sec_count=%now_kai_bao_xiang_time%-%last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %baoxiangjiange% (
	echo 可开宝箱

	call :ke_kai_bao_xiang

	goto :eof
) 

rem pause
goto :eof
====================================

:get_last_kai_bao_xiang_time
call utils_gettimestamp_hms.bat last_kai_bao_xiang_time
rem echo last_kai_bao_xiang_time:%last_kai_bao_xiang_time%
goto :eof

:ke_kai_bao_xiang 
if %kaibaoxiang_param% equ 1 ( 
	echo 退出直播去开宝箱
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 1 > nul
)

rem 从首页去开宝箱

echo 去赚钱页面
adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul


echo 点击宝箱
adb -s %device_name% shell input tap %tap_go_bao_xiang_x% %tap_go_bao_xiang_y%

ping localhost -n 6 > nul


if %boo_kanbaoxiangguanggao% equ 1 (
	echo 点击宝箱广告
	call :kekanbaoxiangguanggao
)

if %boo_kanbaoxiangguanggao% equ 0 (
	echo 关闭宝箱
	adb -s %device_name% shell input tap %tap_close_bao_xiang_x% %tap_close_bao_xiang_y%
)
ping localhost -n 1 > nul

call utils_gettimestamp_hms.bat last_kai_bao_xiang_time

echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
if %kaibaoxiang_param% equ 1 ( 
	echo 回到直播
	adb -s %device_name% shell input tap %tap_go_zhi_bo_x% %tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 
goto :eof

:kekanbaoxiangguanggao
adb -s %device_name% shell input tap %tap_go_bao_xiang_guang_gao_x% %tap_go_bao_xiang_guang_gao_y%
call douyin_kanguanggao.bat 35
goto :eof
 

echo ==

 