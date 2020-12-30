@echo off 
rem 判断是否可以开宝箱 条件 从打开程序开始每隔二十分钟打开一次宝箱
  

if not defined last_kai_bao_xiang_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_bao_xiang_time
)  

set "now_kai_bao_xiang_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_bao_xiang_time
rem echo now_kai_bao_xiang_time:%now_kai_bao_xiang_time%


set /a "sec_count=%now_kai_bao_xiang_time%-%last_kai_bao_xiang_time%"
rem echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr 1210 (
	rem echo 可开宝箱

	call :ke_kai_bao_xiang

	goto :eof
)

set "%1=0"

rem pause
goto :eof
====================================

:get_last_kai_bao_xiang_time
call utils_gettimestamp_hms.bat last_kai_bao_xiang_time
rem echo last_kai_bao_xiang_time:%last_kai_bao_xiang_time%
goto :eof

:ke_kai_bao_xiang 
set last_kai_bao_xiang_time=%now_kai_bao_xiang_time%+30

set "%1=1"
goto :eof

 

 