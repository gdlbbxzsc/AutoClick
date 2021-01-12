echo 抖音

set "app_name=douyin" 

set "reload=%1" 
set "command=%2"

call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%


adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo 点击抖音
adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
ping localhost -n 12 > nul

if %command% equ 901 (
	echo 运行开宝箱程序
	call %root_path%pro_douyin\douyin_kaibaoxiang.bat 900 
	goto :eof
) 
if %command% equ 902 (
	echo 运行看广告程序
	call %root_path%pro_douyin\douyin_qukanguanggao.bat 900
	goto :eof
) 

 
if %command% neq 0 (
	goto :eof
) 



 
call %root_path%pro_douyin\douyin_kanxiaoshuo.bat

call %root_path%pro_douyin\douyin_zoulu.bat

call %root_path%pro_douyin\douyin_kanzhibo.bat

call %root_path%pro_douyin\douyin_kanshipin.bat


echo 退出程序
call %root_path%utils\utils_close.bat

goto :eof






 


