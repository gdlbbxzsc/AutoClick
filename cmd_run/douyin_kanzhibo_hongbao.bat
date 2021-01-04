rem @echo off 
rem 判断是否可以开直播红包 条件 从打开程序开始每隔3分钟打开一次直播红包
  

if not defined douyin_last_kai_zhi_bo_hong_bao_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_hong_bao_time
)  

set "douyin_now_kai_zhi_bo_hong_bao_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat douyin_now_kai_zhi_bo_hong_bao_time
rem echo now_kai_zhi_bo_hong_bao_time:%now_kai_zhi_bo_hong_bao_time%


set /a "sec_count=%douyin_now_kai_zhi_bo_hong_bao_time%-%douyin_last_kai_zhi_bo_hong_bao_time%"
echo 距离上次开直播红包时间：%sec_count%

if %sec_count% gtr %douyin_shouzhibohongbaojiange% (
	echo 可开直播红包

	call :ke_kai_zhi_bo_hong_bao

	goto :eof
)
 

rem pause
goto :eof
====================================

:get_last_kai_zhi_bo_hong_bao_time
call utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_hong_bao_time
rem echo last_kai_zhi_bo_hong_bao_time:%last_kai_zhi_bo_hong_bao_time%
goto :eof

:ke_kai_zhi_bo_hong_bao  

echo 点击直播红包
adb -s %device_name% shell input tap %douyin_tap_zhi_bo_hongbao_x% %douyin_tap_zhi_bo_hongbao_y% 
ping localhost -n 5 > nul 

echo 收下直播红包
adb -s %device_name% shell input tap %douyin_tap_zhi_bo_hongbao_get_x% %douyin_tap_zhi_bo_hongbao_get_y%

call utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_hong_bao_time

echo 开直播红包完毕
 

goto :eof

 

 