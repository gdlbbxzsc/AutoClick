echo �Ա� 

set "app_name=taobao" 

set "reload=%1" 
set "command=%2"

if not defined taobao_load ( 
	call :go_taobao_load
) 


ping localhost -n 3 > nul
 


if %command% equ 901 (
	echo �����첽��
	call %root_path%pro_taobao\taobao_zoululing.bat 900
	goto :eof
) 


adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo ����Ա�
adb -s %device_name% shell input tap %app_taobao_x% %app_taobao_y%
ping localhost -n 16 > nul 
echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %taobao_tap_go_zhuan_qian_x% %taobao_tap_go_zhuan_qian_y%
ping localhost -n 8 > nul


if %command% equ 400 (
	goto :eof
) 

if %command% neq 0 (
	goto :eof
) 

echo ��ȥ׬Ǯ����������
call %root_path%utils\utils_huadongdingbu.bat   
echo ǩ�� 
adb -s %device_name% shell input tap %taobao_tap_qiandao_x1% %taobao_tap_qiandao_y%
ping localhost -n 1 > nul
adb -s %device_name% shell input tap %taobao_tap_qiandao_x2% %taobao_tap_qiandao_y%
ping localhost -n 1 > nul
adb -s %device_name% shell input tap %taobao_tap_qiandao_x3% %taobao_tap_qiandao_y%
ping localhost -n 1 > nul
adb -s %device_name% shell input tap %taobao_tap_qiandao_x4% %taobao_tap_qiandao_y%
ping localhost -n 1 > nul


 
call %root_path%pro_taobao\taobao_zoulu.bat

call %root_path%pro_taobao\taobao_kanzhibo.bat
 
call %root_path%pro_taobao\taobao_kanshipin.bat



echo �˳�����
call %root_path%utils\utils_close.bat

goto :eof

::============
:go_taobao_load
call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%
set "taobao_load=1"

goto :eof
 