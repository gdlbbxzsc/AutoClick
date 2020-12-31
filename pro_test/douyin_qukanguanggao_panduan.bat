@echo off 
rem 判断是否可以开宝箱 条件 从打开程序开始每隔二十分钟打开一次宝箱
  

if not defined last_kan_guang_gao_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kan_guang_gao_time
)  

set "now_kan_guang_gao_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kan_guang_gao_time
rem echo now_kan_guang_gao_time:%now_kan_guang_gao_time%


set /a "sec_count=%now_kan_guang_gao_time%-%last_kan_guang_gao_time%"
rem echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr 1210 (
	rem echo 可开宝箱

	call :ke_kan_guang_gao

	goto :eof
)

set "%1=0"

rem pause
goto :eof
====================================

:get_last_kan_guang_gao_time
call utils_gettimestamp_hms.bat last_kan_guang_gao_time
rem echo last_kan_guang_gao_time:%last_kan_guang_gao_time%
goto :eof

:ke_kan_guang_gao 
set last_kan_guang_gao_time=%now_kan_guang_gao_time%+30

set "%1=1"
goto :eof

 

 