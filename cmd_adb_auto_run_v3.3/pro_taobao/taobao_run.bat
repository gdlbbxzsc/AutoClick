echo ÌÔ±¦ 

set "app_name=taobao" 

set "reload=%1" 
set "command=%2"

call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%


adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo µã»÷ÌÔ±¦
adb -s %device_name% shell input tap %app_taobao_x% %app_taobao_y%
ping localhost -n 12 > nul 
echo È¥×¬Ç®Ò³Ãæ
adb -s %device_name% shell input tap %taobao_tap_go_zhuan_qian_x% %taobao_tap_go_zhuan_qian_y%
ping localhost -n 10 > nul
 
 
if %command% neq 0 (
	goto :eof
) 

 
call %root_path%pro_taobao\taobao_zoulu.bat

call %root_path%pro_taobao\taobao_kanzhibo.bat
 
call %root_path%pro_taobao\taobao_kanshipin.bat



echo ÍË³ö³ÌÐò
call %root_path%utils\utils_close.bat

goto :eof
 