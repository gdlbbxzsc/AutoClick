echo ���п���Ʒ:%boo_douyin_kanshangpin%
if %boo_douyin_kanshangpin% equ 0 goto :eof

 
call %root_path%utils\utils_sp_get.bat douyin_shangpinliulan  

if %douyin_shangpinliulan% gtr 3 ( 
	goto :eof
)

  
set "douyin_qukanguanggao_param=%1" 

call %root_path%utils\utils_sp_get.bat douyin_last_liu_lan_shang_pin_time 

if not defined douyin_last_liu_lan_shang_pin_time ( 
	call :get_douyin_last_liu_lan_shang_pin_time
)  

set "douyin_now_liu_lan_shang_pin_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_liu_lan_shang_pin_time 

set /a "sec_count=%douyin_now_liu_lan_shang_pin_time%-%douyin_last_liu_lan_shang_pin_time%"
echo �����ϴ�ȥ����Ʒʱ�䣺%sec_count%

if %sec_count% gtr %douyin_liulanshangpinrenwujiange% (
	echo ����ȥ����Ʒ
	call :ke_kan_guang_gao 
)
  
goto :eof

::================= 
:get_douyin_last_liu_lan_shang_pin_time
call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_liu_lan_shang_pin_time 
goto :eof

::================= 
:ke_kan_guang_gao  

if %douyin_qukanguanggao_param% equ 1 ( 
	echo �˳�ֱ��ȥ������
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 2 > nul
)
 
echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 10 > nul 

echo ��ȥ׬Ǯ����������
call %root_path%utils\utils_huadongdingbu.bat 

echo ��������Ʒ��ť
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanshangpin_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanshangpin_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanshangpin_y% 10 0

 
echo �����Ʒ
adb -s %device_name% shell input tap %douyin_tap_task_x% %douyin_tap_go_kanshangpin_y%
 
ping localhost -n 6 > nul 
adb -s %device_name% shell input swipe 10 477 10 377
ping localhost -n 4 > nul 
adb -s %device_name% shell input swipe 10 477 10 377
ping localhost -n 4 > nul 
adb -s %device_name% shell input swipe 10 477 10 377
ping localhost -n 4 > nul 
adb -s %device_name% shell input swipe 10 477 10 377
ping localhost -n 4 > nul 
adb -s %device_name% shell input swipe 10 477 10 377
ping localhost -n 4 > nul 
adb -s %device_name% shell input swipe 10 477 10 377




call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_liu_lan_shang_pin_time
call %root_path%utils\utils_sp_put.bat douyin_last_liu_lan_shang_pin_time %douyin_last_liu_lan_shang_pin_time%   


set /a "douyin_shangpinliulan+=1"
call %root_path%utils\utils_sp_put.bat douyin_shangpinliulan %douyin_shangpinliulan%   

echo �˳������Ʒ
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
 
echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
 
if %douyin_qukanguanggao_param% equ 1 ( 
	echo �ص�ֱ��
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

goto :eof

 

 