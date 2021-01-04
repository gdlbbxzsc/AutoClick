rem @echo off 
rem 判断是否可以开宝箱 条件 从打开程序开始每隔二十分钟打开一次宝箱


set "kaibaoxiang_param=%1"
    

if not defined taobao_last_kai_bao_xiang_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_bao_xiang_time
)  

set "taobao_now_kai_bao_xiang_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat taobao_now_kai_bao_xiang_time
rem echo now_kai_bao_xiang_time:%now_kai_bao_xiang_time%


set /a "sec_count=%taobao_now_kai_bao_xiang_time%-%taobao_last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %taobao_baoxiangjiange% (
	echo 可开宝箱

	call :ke_kai_bao_xiang

	goto :eof
) 

rem pause
goto :eof
::====================================

:get_last_kai_bao_xiang_time
call utils_gettimestamp_hms.bat taobao_last_kai_bao_xiang_time
rem echo last_kai_bao_xiang_time:%last_kai_bao_xiang_time%
goto :eof

:ke_kai_bao_xiang 
 
rem 从首页去开宝箱

echo 去赚钱页面
adb -s %device_name% shell input keyevent 4

ping localhost -n 4 > nul


echo 点击宝箱
adb -s %device_name% shell input tap %taobao_tap_go_bao_xiang_x% %taobao_tap_go_bao_xiang_y%

ping localhost -n 6 > nul

 echo 关闭宝箱
adb -s %device_name% shell input tap %taobao_tap_close_bao_xiang_x% %taobao_tap_close_bao_xiang_y%
 
ping localhost -n 1 > nul

call utils_gettimestamp_hms.bat last_kai_bao_xiang_time


set "taobao_baoxiangjiange=1210"

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


::============================
:taobao_huidaozhibo

echo 将去赚钱滑动到顶部
call common_huadongdingbu.bat   

rem echo 滑动到看直播按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0 

 
rem echo 点击看直播
adb -s %device_name% shell input tap %taobao_tap_go_zhibo_x% %taobao_tap_go_zhibo_y%
  
ping localhost -n 3 > nul

 goto :eof

::============================
:taobao_huidaoshipin

echo 将去赚钱滑动到顶部
call common_huadongdingbu.bat   

rem echo 滑动到看视频按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
rem echo 点击看视频
adb -s %device_name% shell input tap %taobao_tap_go_shipin_x% %taobao_tap_go_shipin_y%
  
ping localhost -n 3 > nul

 goto :eof

 