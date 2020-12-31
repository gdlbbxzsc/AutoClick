@echo off 
rem 判断是否可以开直播红包 条件 从打开程序开始每隔3分钟打开一次直播红包
  

if not defined last_kai_zhi_bo_hong_bao_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_hong_bao_time
)  

set "now_kai_zhi_bo_hong_bao_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_zhi_bo_hong_bao_time
rem echo now_kai_zhi_bo_hong_bao_time:%now_kai_zhi_bo_hong_bao_time%


set /a "sec_count=%now_kai_zhi_bo_hong_bao_time%-%last_kai_zhi_bo_hong_bao_time%"
rem echo 距离上次开红包时间：%sec_count%

if %sec_count% gtr 181 (
	rem echo 可开直播红包

	call :ke_kai_zhi_bo_hong_bao

	goto :eof
)

set "%1=0"

rem pause
goto :eof
====================================

:get_last_kai_zhi_bo_hong_bao_time
call utils_gettimestamp_hms.bat last_kai_zhi_bo_hong_bao_time
rem echo last_kai_zhi_bo_hong_bao_time:%last_kai_zhi_bo_hong_bao_time%
goto :eof

:ke_kai_zhi_bo_hong_bao 
set last_kai_zhi_bo_hong_bao_time=%now_kai_zhi_bo_hong_bao_time%+2

set "%1=1"
goto :eof

 

 