echo 运行看视频:%boo_kuaishou_kanshipin%
if %boo_kuaishou_kanshipin% equ 0 goto :eof

:shipinxun_huan 



echo 视频暂停15秒 
ping localhost -n 12 > nul 


call %root_path%utils\utils_check_activity.bat %kuaishou_shipin%
 
echo 视频滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0


echo 运行开宝箱程序
call %root_path%pro_kuaishou\kuaishou_kaibaoxiang.bat 0


echo 运行全程序逻辑判断
call %root_path%alltask_check.bat 4

echo 判断视频时长
call :panduan_shipin_time

if %is_tui_shipin_bo% equ 1 goto :the_end_exit

goto :shipinxun_huan
 
goto :eof

::================= 
:panduan_shipin_time 
if not defined kuaishou_last_kai_shi_pin_time ( 
	call :get_last_kai_shi_pin_time
)  

set "kuaishou_now_kai_shi_pin_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_now_kai_shi_pin_time 
 
set /a "sec_count=%kuaishou_now_kai_shi_pin_time%-%kuaishou_last_kai_shi_pin_time%"
 
call %root_path%utils\utils_sp_get.bat kuaishou_kanshipin_long  
if %sec_count% lss %kuaishou_kanshipin_long% (
	set "sec_count=%kuaishou_kanshipin_long%"
)

call %root_path%utils\utils_sp_put.bat kuaishou_kanshipin_long %sec_count% 

echo 距离上次看视频时间：%sec_count%


if %sec_count% gtr %kuaishou_kanshipinzongshichang% (
	rem echo 可退出视频 
	set "is_tui_shipin_bo=1" 
	goto :eof
)

set "is_tui_shipin_bo=0"
 
goto :eof

::================= 
:get_last_kai_shi_pin_time
call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_last_kai_shi_pin_time 
goto :eof

::================= 
:the_end_exit   
set "kuaishou_last_kai_shi_pin_time=" 
set "kuaishou_now_kai_shi_pin_time=" 
 
call %root_path%utils\utils_sp_put.bat boo_kuaishou_kanshipin 0

echo "可退出视频"
goto :eof

  