rem @echo off 
rem 循环 看视频 

echo 开始看视频  
 
:shipinxun_huan 

echo 视频暂停10秒 
ping localhost -n 10 > nul 

echo 视频滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0


echo 运行开宝箱程序
call douyin_kaibaoxiang.bat 0 

echo 是否看广告任务%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 1 call :shipinkekanguanggaorenwu


echo 运行全程序逻辑判断
call alltask_check.bat 3

echo 判断视频时长
call :panduan_shipin_time

if %is_tui_shipin_bo% equ 1 goto :the_end_exit

goto :shipinxun_huan
 
rem echo end-pause
rem pause 
goto :eof
::======================================


 

:panduan_shipin_time
 rem 判断是否可以退出视频 条件为 超过180分钟
  
if not defined douyin_last_kai_shi_pin_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_shi_pin_time
)  

set "douyin_now_kai_shi_pin_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat douyin_now_kai_shi_pin_time
rem echo douyin_now_kai_shi_pin_time:%douyin_now_kai_shi_pin_time%


set /a "sec_count=%douyin_now_kai_shi_pin_time%-%douyin_last_kai_shi_pin_time%"
echo 距离上次看视频时间：%sec_count%

if %sec_count% gtr %douyin_kanshipinzongshichang% (
	rem echo 可退出视频

	set "is_tui_shipin_bo=1"

	goto :eof
)

set "is_tui_shipin_bo=0"

rem pause
goto :eof
::====================================

:get_last_kai_shi_pin_time
call utils_gettimestamp_hms.bat douyin_last_kai_shi_pin_time
rem echo douyin_last_kai_shi_pin_time:%douyin_last_kai_shi_pin_time%
goto :eof

:the_end_exit 
rem set last_kai_shi_pin_time=%now_kai_shi_pin_time%+2
call utils_gettimestamp_hms.bat douyin_last_kai_shi_pin_time
rem adb -s %device_name% shell input keyevent 4
 
echo "可退出视频"
goto :eof

 
      
:shipinkekanguanggaorenwu
call douyin_qukanguanggao.bat 0
goto :eof 
