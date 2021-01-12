echo 头条

set "app_name=toutiao" 

set "reload=%1" 
set "command=%2"

call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%


adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo 点击头条
adb -s %device_name% shell input tap %app_toutiao_x% %app_toutiao_y%
ping localhost -n 18 > nul

 
if %command% neq 0 (
	goto :eof
) 




call %root_path%pro_toutiao\toutiao_zoulu.bat

call %root_path%pro_toutiao\toutiao_kanxiaoshuo.bat
 
call %root_path%pro_toutiao\toutiao_kanxinwen.bat


echo 退出程序
call %root_path%utils\utils_close.bat
  
goto :eof

 
 
