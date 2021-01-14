echo ����

set "app_name=douyin" 

set "reload=%1" 
set "command=%2"

if not defined douyin_load ( 
	call :go_douyin_load
) 
 
ping localhost -n 3 > nul


if %command% equ 901 (
	echo ���п��������
	call %root_path%pro_douyin\douyin_kaibaoxiang.bat 900 
	goto :eof
) 
if %command% equ 902 (
	echo ���п�������
	call %root_path%pro_douyin\douyin_qukanguanggao.bat 900
	goto :eof
) 

if %command% equ 903 (
	echo ���гԷ�����
	call %root_path%pro_douyin\douyin_chifan.bat 900
	goto :eof
) 

if %command% equ 904 (
	echo ����˯������
	call %root_path%pro_douyin\douyin_shuijiao.bat 900
	goto :eof
) 
 
 

adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul
echo �������
adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
ping localhost -n 16 > nul


if %command% equ 400 (
	goto :eof
) 

if %command% neq 0 (
	goto :eof
) 

 
call %root_path%pro_douyin\douyin_kanxiaoshuo.bat

call %root_path%pro_douyin\douyin_zoulu.bat

call %root_path%pro_douyin\douyin_kanzhibo.bat

call %root_path%pro_douyin\douyin_kanshipin.bat


echo �˳�����
call %root_path%utils\utils_close.bat

goto :eof

::============
:go_douyin_load
call %root_path%utils\utils_config_load.bat
call %root_path%utils\utils_config_reload.bat %reload%
set "douyin_load=1"

goto :eof





 


