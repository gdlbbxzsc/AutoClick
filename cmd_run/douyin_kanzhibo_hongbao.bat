rem @echo off 
rem �ж��Ƿ���Կ�ֱ����� ���� �Ӵ򿪳���ʼÿ��3���Ӵ�һ��ֱ�����
  

if not defined douyin_last_kai_zhi_bo_hong_bao_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_hong_bao_time
)  

set "douyin_now_kai_zhi_bo_hong_bao_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat douyin_now_kai_zhi_bo_hong_bao_time
rem echo now_kai_zhi_bo_hong_bao_time:%now_kai_zhi_bo_hong_bao_time%


set /a "sec_count=%douyin_now_kai_zhi_bo_hong_bao_time%-%douyin_last_kai_zhi_bo_hong_bao_time%"
echo �����ϴο�ֱ�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_shouzhibohongbaojiange% (
	echo �ɿ�ֱ�����

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

echo ���ֱ�����
adb -s %device_name% shell input tap %douyin_tap_zhi_bo_hongbao_x% %douyin_tap_zhi_bo_hongbao_y% 
ping localhost -n 5 > nul 

echo ����ֱ�����
adb -s %device_name% shell input tap %douyin_tap_zhi_bo_hongbao_get_x% %douyin_tap_zhi_bo_hongbao_get_y%

call utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_hong_bao_time

echo ��ֱ��������
 

goto :eof

 

 