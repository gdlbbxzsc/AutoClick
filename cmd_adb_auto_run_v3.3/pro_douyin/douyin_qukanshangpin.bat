echo 运行看商品:%boo_douyin_kanshangpin%
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
echo 距离上次去看商品时间：%sec_count%

if %sec_count% gtr %douyin_liulanshangpinrenwujiange% (
	echo 可以去看商品
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
	echo 退出直播去开宝箱
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 2 > nul
)
 
echo 去赚钱页面
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 10 > nul 

echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat 

echo 滑动到商品按钮
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanshangpin_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanshangpin_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanshangpin_y% 10 0

 
echo 点击商品
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

echo 退出浏览商品
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
 
echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul
 
if %douyin_qukanguanggao_param% equ 1 ( 
	echo 回到直播
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

goto :eof

 

 