@echo off 
rem �ж��Ƿ���Կ����� ���� �Ӵ򿪳���ʼÿ����ʮ���Ӵ�һ�α���
  

if not defined last_kai_bao_xiang_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_bao_xiang_time
)  

set "now_kai_bao_xiang_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_bao_xiang_time
rem echo now_kai_bao_xiang_time:%now_kai_bao_xiang_time%


set /a "sec_count=%now_kai_bao_xiang_time%-%last_kai_bao_xiang_time%"
rem echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr 1210 (
	rem echo �ɿ�����

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

 

 