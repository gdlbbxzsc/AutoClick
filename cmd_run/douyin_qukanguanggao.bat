rem @echo off 
rem ÿ��ʮ����ȥ��һ�ο��������
  
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
echo �����ϴ�ȥ�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_qukanguanggaorenwujiange% (
	echo ����ȥ�����
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
	echo �˳�ֱ��ȥ������
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 1 > nul
)

echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo ��ȥ׬Ǯ����������
call common_huadongdingbu.bat 

echo ��������水ť
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0

 
echo ������
adb -s %device_name% shell input tap %douyin_tap_go_guang_gao_x% %douyin_tap_go_guang_gao_y%
  
call douyin_kanguanggao.bat 35

call utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time

rem echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
if %douyin_qukanguanggao_param% equ 1 ( 
	echo �ص�ֱ��
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

goto :eof

 

 