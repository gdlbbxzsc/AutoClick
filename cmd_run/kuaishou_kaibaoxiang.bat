rem @echo off 
rem �ж��Ƿ���Կ����� ���� �Ӵ򿪳���ʼÿ����ʮ���Ӵ�һ�α���
    

if not defined kuaishou_last_kai_bao_xiang_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_bao_xiang_time
)  

set "kuaishou_now_kai_bao_xiang_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat kuaishou_now_kai_bao_xiang_time
rem echo now_kai_bao_xiang_time:%now_kai_bao_xiang_time%


set /a "sec_count=%kuaishou_now_kai_bao_xiang_time%-%kuaishou_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %kuaishou_baoxiangjiange% (
	echo �ɿ�����

	call :ke_kai_bao_xiang

	goto :eof
) 

rem pause
goto :eof
====================================

:get_last_kai_bao_xiang_time
call utils_gettimestamp_hms.bat kuaishou_last_kai_bao_xiang_time
rem echo last_kai_bao_xiang_time:%last_kai_bao_xiang_time%
goto :eof

:ke_kai_bao_xiang 
 
rem ����ҳȥ������

echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%

ping localhost -n 2 > nul


echo �������
adb -s %device_name% shell input tap %kuaishou_tap_go_bao_xiang_x% %kuaishou_tap_go_bao_xiang_y%

ping localhost -n 6 > nul

echo ���������
adb -s %device_name% shell input tap %kuaishou_tap_go_bao_xiang_guang_gao_x% %kuaishou_tap_go_bao_xiang_guang_gao_y%
call kuaishou_kanguanggao.bat 35
 
ping localhost -n 1 > nul

call utils_gettimestamp_hms.bat last_kai_bao_xiang_time

echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
 
goto :eof

 

 