echo 快手 

set "app_name=kuaishou" 

set "reload=%1" 
set "command=%2"

call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%


adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo 点击快手
adb -s %device_name% shell input tap %app_kuaishou_x% %app_kuaishou_y%
ping localhost -n 12 > nul

if %command% equ 901 (
	echo 运行开宝箱程序
	call %root_path%pro_kuaishou\kuaishou_kaibaoxiang.bat 900
	goto :eof
) 

 
if %command% neq 0 (
	goto :eof
) 




call %root_path%pro_kuaishou\kuaishou_kanzhibo.bat

call %root_path%pro_kuaishou\kuaishou_fulirenwu.bat

call %root_path%pro_kuaishou\kuaishou_kanshipin.bat



echo 退出程序
call %root_path%utils\utils_close.bat

goto :eof
 