echo ͷ��

set "app_name=toutiao" 

set "reload=%1" 
set "command=%2"

if not defined toutiao_load ( 
	call :go_toutiao_load
) 
 

ping localhost -n 3 > nul


adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo ���ͷ��
adb -s %device_name% shell input tap %app_toutiao_x% %app_toutiao_y%
ping localhost -n 16 > nul


if %command% equ 400 (
	goto :eof
) 

if %command% neq 0 (
	goto :eof
) 


call %root_path%pro_toutiao\toutiao_zoulu.bat

call %root_path%pro_toutiao\toutiao_kanxiaoshuo.bat
 
call %root_path%pro_toutiao\toutiao_kanxinwen.bat


echo �˳�����
call %root_path%utils\utils_close.bat
  
goto :eof


::============
:go_toutiao_load
call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%
set "toutiao_load=1"

goto :eof

 
 
