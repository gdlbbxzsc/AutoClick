@echo off 
rem 判断是否可以退出直播 条件为 超过三十分钟
  

if not defined last_kai_zhi_bo_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_time
)  

set "now_kai_zhi_bo_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_zhi_bo_time
rem echo now_kai_zhi_bo_time:%now_kai_zhi_bo_time%


set /a "sec_count=%now_kai_zhi_bo_time%-%last_kai_zhi_bo_time%"
rem echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr 1800 (
	rem echo 可退出直播

	call :ke_kai_zhi_bo

	goto :eof
)

set "%1=0"

rem pause
goto :eof
====================================

:get_last_kai_zhi_bo_time
call utils_gettimestamp_hms.bat last_kai_zhi_bo_time
rem echo last_kai_zhi_bo_time:%last_kai_zhi_bo_time%
goto :eof

:ke_kai_zhi_bo 
set last_kai_zhi_bo_time=%now_kai_zhi_bo_time%+2

set "%1=1"
goto :eof

 

 