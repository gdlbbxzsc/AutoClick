rem @echo off 
rem �ж��Ƿ���Կ����� ���� �Ӵ򿪳���ʼÿ����ʮ���Ӵ�һ�α���
   
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
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %baoxiangjiange% (
	echo �ɿ�����

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
	echo �˳�ֱ��ȥ������
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 1 > nul
)

rem ����ҳȥ������

echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul


echo �������
adb -s %device_name% shell input tap %tap_go_bao_xiang_x% %tap_go_bao_xiang_y%

ping localhost -n 6 > nul


if %boo_kanbaoxiangguanggao% equ 1 (
	echo ���������
	call :kekanbaoxiangguanggao
)

if %boo_kanbaoxiangguanggao% equ 0 (
	echo �رձ���
	adb -s %device_name% shell input tap %tap_close_bao_xiang_x% %tap_close_bao_xiang_y%
)
ping localhost -n 1 > nul

call utils_gettimestamp_hms.bat last_kai_bao_xiang_time

echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
if %kaibaoxiang_param% equ 1 ( 
	echo �ص�ֱ��
	adb -s %device_name% shell input tap %tap_go_zhi_bo_x% %tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 
goto :eof

:kekanbaoxiangguanggao
adb -s %device_name% shell input tap %tap_go_bao_xiang_guang_gao_x% %tap_go_bao_xiang_guang_gao_y%
call douyin_kanguanggao.bat 35
goto :eof
 

echo ==

 