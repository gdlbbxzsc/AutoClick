echo ���п���Ʒ:%boo_toutiao_kanshangpin%
if %boo_toutiao_kanshangpin% equ 0 goto :eof

 
call %root_path%utils\utils_sp_get.bat toutiao_shangpinliulan  

if %toutiao_shangpinliulan% gtr 3 ( 
	goto :eof
)

  
set "toutiao_qukanguanggao_param=%1" 

call %root_path%utils\utils_sp_get.bat toutiao_last_liu_lan_shang_pin_time  
call %root_path%utils\utils_gettimestamp_hms.bat toutiao_now_liu_lan_shang_pin_time 

set /a "sec_count=%toutiao_now_liu_lan_shang_pin_time%-%toutiao_last_liu_lan_shang_pin_time%"
echo �����ϴ�ȥ����Ʒʱ�䣺%sec_count%

if %sec_count% gtr %toutiao_liulanshangpinrenwujiange% (
	echo ����ȥ����Ʒ
	call :ke_kan_guang_gao 
)
  
goto :eof
 
::================= 
:ke_kan_guang_gao  

if %toutiao_qukanguanggao_param% equ 0 ( 
	echo ���ȥ׬Ǯ
	adb -s %device_name% shell input tap %toutiao_tap_go_zhuan_qian_x% %toutiao_tap_go_zhuan_qian_y%
	ping localhost -n 6 > nul
)
 
 

echo ��ȥ׬Ǯ����������
call %root_path%utils\utils_huadongdingbu.bat 

echo ��������Ʒ��ť
adb -s %device_name% shell input swipe 10 %toutiao_swipe_to_kanshangpin_y% 10 0 
adb -s %device_name% shell input swipe 10 %toutiao_swipe_to_kanshangpin_y% 10 0 
adb -s %device_name% shell input swipe 10 %toutiao_swipe_to_kanshangpin_y% 10 0

 
echo �����Ʒ
adb -s %device_name% shell input tap %toutiao_tap_task_x% %toutiao_tap_go_kanshangpin_y% 
 
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




call %root_path%utils\utils_gettimestamp_hms.bat toutiao_last_liu_lan_shang_pin_time
call %root_path%utils\utils_sp_put.bat toutiao_last_liu_lan_shang_pin_time %toutiao_last_liu_lan_shang_pin_time%   


set /a "toutiao_shangpinliulan+=1"
call %root_path%utils\utils_sp_put.bat toutiao_shangpinliulan %toutiao_shangpinliulan%   

 
rem echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4

ping localhost -n 1 > nul
if %toutiao_qukanguanggao_param% equ 0 ( 
	echo ���������
	adb -s %device_name% shell input tap %toutiao_tap_go_kan_xin_wen_x% %toutiao_tap_go_kan_xin_wen_y%
	ping localhost -n 4 > nul
) 

goto :eof

 

 