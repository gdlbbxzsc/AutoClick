rem @echo off 
  
echo 将去赚钱滑动到顶部
call common_huadongdingbu.bat   

rem echo 滑动到看视频按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
rem echo 点击看视频
adb -s %device_name% shell input tap %taobao_tap_go_shipin_x% %taobao_tap_go_shipin_y%
  
ping localhost -n 3 > nul

echo 开始看视频  

:shipinxun_huan

set /a m+=1

echo 视频滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0
  
echo 暂停20秒 
ping localhost -n 20 > nul 

 
echo 运行开宝箱程序
call taobao_kaibaoxiang.bat 0


echo 运行全程序逻辑判断
call alltask_check.bat 5


echo 判断视频时长
call :panduan_shipin_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo 重新循环视频程序
goto :shipinxun_huan
 

goto :eof

 
::======================================

:panduan_shipin_time 
rem 判断是否可以退出视频 条件为 超过三十分钟
  
if not defined taobao_last_kai_zhi_bo_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_time
)  

set "taobao_now_kai_zhi_bo_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat taobao_now_kai_zhi_bo_time
rem echo now_kai_zhi_bo_time:%now_kai_zhi_bo_time%


set /a "sec_count=%taobao_now_kai_zhi_bo_time%-%taobao_last_kai_zhi_bo_time%"
rem echo 距离上次视频时间：%sec_count%

if %sec_count% gtr %taobao_kanshipinzongshichang% (
	rem echo 可退出视频

	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"

rem pause
goto :eof
::====================================

:get_last_kai_zhi_bo_time
call utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
rem echo last_kai_zhi_bo_time:%taobao_last_kai_zhi_bo_time%
goto :eof

:the_end_exit 
rem set last_kai_zhi_bo_time=%now_kai_zhi_bo_time%+2
call utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
adb -s %device_name% shell input keyevent 4 
ping localhost -n 1 > nul 
 
echo "退出视频"
goto :eof
 
 


