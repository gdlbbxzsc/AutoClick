set "kaibaoxiang_param=%1"
    
call %root_path%utils\utils_sp_get.bat taobao_last_kai_bao_xiang_time 
if not defined taobao_last_kai_bao_xiang_time ( 
	call :get_last_kai_bao_xiang_time
)  

set "taobao_now_kai_bao_xiang_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat taobao_now_kai_bao_xiang_time 


set /a "sec_count=%taobao_now_kai_bao_xiang_time%-%taobao_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %taobao_baoxiangjiange% (
	echo �ɿ����� 
	call :ke_kai_bao_xiang 
) 
 
goto :eof

::=================== 
:get_last_kai_bao_xiang_time
call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_bao_xiang_time 
goto :eof

::=================== 
:ke_kai_bao_xiang 
  
echo ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4 
ping localhost -n 4 > nul


echo �������
adb -s %device_name% shell input tap %taobao_tap_go_bao_xiang_x% %taobao_tap_go_bao_xiang_y%
ping localhost -n 4 > nul

echo �رձ���
adb -s %device_name% shell input tap %taobao_tap_close_bao_xiang_x% %taobao_tap_close_bao_xiang_y%
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_bao_xiang_time
call %root_path%utils\utils_sp_put.bat taobao_last_kai_bao_xiang_time %taobao_last_kai_bao_xiang_time%  

set "temp_taobao_bxjg=%taobao_baoxiangjiange%"
  
if %temp_taobao_bxjg% gtr 1205 (
	set "taobao_baoxiangjiange=1205"
)
if %temp_taobao_bxjg% leq 785 (
	set "taobao_baoxiangjiange=1205"
) 
if %temp_taobao_bxjg% leq 485 (
	set "taobao_baoxiangjiange=785"
)
if %temp_taobao_bxjg% leq 305 (
	set "taobao_baoxiangjiange=485"
)
if %temp_taobao_bxjg% leq 185 (
	set "taobao_baoxiangjiange=305"
)
if %temp_taobao_bxjg% leq 125 (
	set "taobao_baoxiangjiange=185"
)
if %temp_taobao_bxjg% leq 65 (
	set "taobao_baoxiangjiange=125"
)
if %temp_taobao_bxjg% leq 64 (
	set "taobao_baoxiangjiange=65"
) 
if %temp_taobao_bxjg% leq 5 (
	set "taobao_baoxiangjiange=64"
)
call %root_path%utils\utils_sp_put.bat taobao_baoxiangjiange %taobao_baoxiangjiange%    
echo ���������� %taobao_baoxiangjiange%

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


::=================== 
:taobao_huidaozhibo

rem echo ��ȥ׬Ǯ����������
rem call %root_path%utils\utils_huadongdingbu.bat   

echo ��������ֱ����ť
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0 
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  


 
echo �����ֱ��
adb -s %device_name% shell input tap %taobao_tap_go_zhibo_x% %taobao_tap_go_zhibo_y%
ping localhost -n 3 > nul

goto :eof

::=================== 
:taobao_huidaoshipin

rem echo ��ȥ׬Ǯ����������
rem call %root_path%utils\utils_huadongdingbu.bat   

echo ����������Ƶ��ť
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
echo �������Ƶ
adb -s %device_name% shell input tap %taobao_tap_go_shipin_x% %taobao_tap_go_shipin_y%
ping localhost -n 3 > nul

goto :eof

 