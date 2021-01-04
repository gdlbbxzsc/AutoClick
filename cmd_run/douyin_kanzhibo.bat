rem @echo  off 
rem 循环 看直播

echo 运行看直播程序
 
echo 点击去看直播
ping localhost -n 2 > nul
adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y% 
ping localhost -n 1 > nul

echo 开始看直播  
 
:zhiboxun_huan 




echo 直播滑动翻页
adb -s %device_name% shell input swipe 10 477 10 0 
ping localhost -n 30 > nul 

echo 运行直播红包程序
call douyin_kanzhibo_hongbao.bat 

echo 运行开宝箱程序
call douyin_kaibaoxiang.bat 1

echo 是否看广告任务%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 1 call :zhibokekanguanggaorenwu


echo 运行全程序逻辑判断
call alltask_check.bat 3


echo 判断直播时长
call :panduan_zhibo_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo 重新循环直播程序
goto :zhiboxun_huan
 
rem echo end-pause
rem pause 
goto :eof
::======================================

:panduan_zhibo_time 
rem 判断是否可以退出直播 条件为 超过三十分钟
  
if not defined douyin_last_kai_zhi_bo_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_time
)  

set "douyin_now_kai_zhi_bo_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat douyin_now_kai_zhi_bo_time
rem echo now_kai_zhi_bo_time:%now_kai_zhi_bo_time%


set /a "sec_count=%douyin_now_kai_zhi_bo_time%-%douyin_last_kai_zhi_bo_time%"
rem echo 距离上次直播时间：%sec_count%

if %sec_count% gtr %douyin_kanzhibozongshichang% (
	rem echo 可退出直播

	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"

rem pause
goto :eof
::====================================

:get_last_kai_zhi_bo_time
call utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_time
rem echo last_kai_zhi_bo_time:%douyin_last_kai_zhi_bo_time%
goto :eof

:the_end_exit 
rem set last_kai_zhi_bo_time=%now_kai_zhi_bo_time%+2
call utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_time
adb -s %device_name% shell input keyevent 4
 
echo "退出直播"
goto :eof
 
:zhibokekanguanggaorenwu
call douyin_qukanguanggao.bat 1
goto :eof