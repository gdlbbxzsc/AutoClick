rem @echo off 
rem �ж��Ƿ���Կ����� ���� �Ӵ򿪳���ʼÿ����ʮ���Ӵ�һ�α���


set "kaibaoxiang_param=%1"
    

if not defined taobao_last_kai_bao_xiang_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_bao_xiang_time
)  

set "taobao_now_kai_bao_xiang_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat taobao_now_kai_bao_xiang_time
rem echo now_kai_bao_xiang_time:%now_kai_bao_xiang_time%


set /a "sec_count=%taobao_now_kai_bao_xiang_time%-%taobao_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %taobao_baoxiangjiange% (
	echo �ɿ�����

	call :ke_kai_bao_xiang

	goto :eof
) 

rem pause
goto :eof
::====================================

:get_last_kai_bao_xiang_time
call utils_gettimestamp_hms.bat taobao_last_kai_bao_xiang_time
rem echo last_kai_bao_xiang_time:%last_kai_bao_xiang_time%
goto :eof

:ke_kai_bao_xiang 
 
rem ����ҳȥ������

echo ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4

ping localhost -n 4 > nul


echo �������
adb -s %device_name% shell input tap %taobao_tap_go_bao_xiang_x% %taobao_tap_go_bao_xiang_y%

ping localhost -n 6 > nul

 echo �رձ���
adb -s %device_name% shell input tap %taobao_tap_close_bao_xiang_x% %taobao_tap_close_bao_xiang_y%
 
ping localhost -n 1 > nul

call utils_gettimestamp_hms.bat last_kai_bao_xiang_time


set "taobao_baoxiangjiange=1210"

if %kaibaoxiang_param% equ 1 ( 
	echo �ص�ֱ��
	call :taobao_huidaozhibo
	goto :eof
) 

if %kaibaoxiang_param% equ 0 ( 
	echo �ص���Ƶ
	call :taobao_huidaoshipin
	goto :eof
) 


 
goto :eof


::============================
:taobao_huidaozhibo

echo ��ȥ׬Ǯ����������
call common_huadongdingbu.bat   

rem echo ��������ֱ����ť
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0 

 
rem echo �����ֱ��
adb -s %device_name% shell input tap %taobao_tap_go_zhibo_x% %taobao_tap_go_zhibo_y%
  
ping localhost -n 3 > nul

 goto :eof

::============================
:taobao_huidaoshipin

echo ��ȥ׬Ǯ����������
call common_huadongdingbu.bat   

rem echo ����������Ƶ��ť
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
rem echo �������Ƶ
adb -s %device_name% shell input tap %taobao_tap_go_shipin_x% %taobao_tap_go_shipin_y%
  
ping localhost -n 3 > nul

 goto :eof

 