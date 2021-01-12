set "kaibaoxiang_param=%1"
    
call %root_path%utils\utils_sp_get.bat taobao_last_kai_bao_xiang_time 
if not defined taobao_last_kai_bao_xiang_time ( 
	call :get_last_kai_bao_xiang_time
)  

set "taobao_now_kai_bao_xiang_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat taobao_now_kai_bao_xiang_time 


set /a "sec_count=%taobao_now_kai_bao_xiang_time%-%taobao_last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %taobao_baoxiangjiange% (
	echo 可开宝箱 
	call :ke_kai_bao_xiang 
) 
 
goto :eof

::=================== 
:get_last_kai_bao_xiang_time
call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_bao_xiang_time 
goto :eof

::=================== 
:ke_kai_bao_xiang 
  
echo 去赚钱页面
adb -s %device_name% shell input keyevent 4 
ping localhost -n 4 > nul


echo 点击宝箱
adb -s %device_name% shell input tap %taobao_tap_go_bao_xiang_x% %taobao_tap_go_bao_xiang_y%
ping localhost -n 4 > nul

echo 关闭宝箱
adb -s %device_name% shell input tap %taobao_tap_close_bao_xiang_x% %taobao_tap_close_bao_xiang_y%
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_bao_xiang_time
call %root_path%utils\utils_sp_put.bat taobao_last_kai_bao_xiang_time %taobao_last_kai_bao_xiang_time%  

set "temp_taobao_bxjg=%taobao_baoxiangjiange%"
  
if %temp_taobao_bxjg% gtr 1205 (
	set "taobao_baoxiangjiange=1205"
)
if %temp_taobao_bxjg% leq 785 (
	set "taobao_baoxiangjiange=1205"
) 
if %temp_taobao_bxjg% leq 485 (
	set "taobao_baoxiangjiange=785"
)
if %temp_taobao_bxjg% leq 305 (
	set "taobao_baoxiangjiange=485"
)
if %temp_taobao_bxjg% leq 185 (
	set "taobao_baoxiangjiange=305"
)
if %temp_taobao_bxjg% leq 125 (
	set "taobao_baoxiangjiange=185"
)
if %temp_taobao_bxjg% leq 65 (
	set "taobao_baoxiangjiange=125"
)
if %temp_taobao_bxjg% leq 64 (
	set "taobao_baoxiangjiange=65"
) 
if %temp_taobao_bxjg% leq 5 (
	set "taobao_baoxiangjiange=64"
)
call %root_path%utils\utils_sp_put.bat taobao_baoxiangjiange %taobao_baoxiangjiange%    
echo 宝开箱间隔： %taobao_baoxiangjiange%

if %kaibaoxiang_param% equ 1 ( 
	echo 回到直播
	call :taobao_huidaozhibo
	goto :eof
) 

if %kaibaoxiang_param% equ 0 ( 
	echo 回到视频
	call :taobao_huidaoshipin
	goto :eof
)   
goto :eof


::=================== 
:taobao_huidaozhibo

rem echo 将去赚钱滑动到顶部
rem call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看直播按钮
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0 
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  


 
echo 点击看直播
adb -s %device_name% shell input tap %taobao_tap_go_zhibo_x% %taobao_tap_go_zhibo_y%
ping localhost -n 3 > nul

goto :eof

::=================== 
:taobao_huidaoshipin

rem echo 将去赚钱滑动到顶部
rem call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看视频按钮
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
rem adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
echo 点击看视频
adb -s %device_name% shell input tap %taobao_tap_go_shipin_x% %taobao_tap_go_shipin_y%
ping localhost -n 3 > nul

goto :eof

 