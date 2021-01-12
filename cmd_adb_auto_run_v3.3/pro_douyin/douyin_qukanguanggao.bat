echo 是否看广告任务%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 0 goto :eof

  
set "douyin_qukanguanggao_param=%1"

call %root_path%utils\utils_sp_get.bat douyin_last_qu_kan_guang_gao_time  
if not defined douyin_last_qu_kan_guang_gao_time ( 
	call :get_douyin_last_qu_kan_guang_gao_time
)  

set "douyin_now_qu_kan_guang_gao_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_qu_kan_guang_gao_time 

set /a "sec_count=%douyin_now_qu_kan_guang_gao_time%-%douyin_last_qu_kan_guang_gao_time%"
echo 距离上次去看广告时间：%sec_count%

if %sec_count% gtr %douyin_qukanguanggaorenwujiange% (
	echo 可以去看广告
	call :ke_kan_guang_gao 
)
  
goto :eof

::================== 
:get_douyin_last_qu_kan_guang_gao_time
call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time 
goto :eof

::==================
:ke_kan_guang_gao  

if %douyin_qukanguanggao_param% equ 900 ( 
	rem 这里是为全程序判断做的变量修改
	set "alltask_has_run_result=1" 
)

if %douyin_qukanguanggao_param% equ 1 ( 
	echo 退出直播去开宝箱
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 1 > nul
)

echo 去赚钱页面
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 10 > nul

echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat 

echo 滑动到广告按钮
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0

 
echo 点击广告
adb -s %device_name% shell input tap %douyin_tap_task_x% %douyin_tap_go_guang_gao_y%
  
call %root_path%pro_douyin\douyin_kanguanggao.bat 36
 
echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time
call %root_path%utils\utils_sp_put.bat douyin_last_qu_kan_guang_gao_time %douyin_last_qu_kan_guang_gao_time%   


if %douyin_qukanguanggao_param% equ 1 ( 
	echo 回到直播
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

if %douyin_qukanguanggao_param% equ 900 ( 
	echo 退出程序
	call %root_path%utils\utils_close.bat
)

goto :eof

 

 