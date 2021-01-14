echo 运行看视频:%boo_taobao_kanshipin%
if %boo_taobao_kanshipin% equ 0 goto :eof 


rem echo 将去赚钱滑动到顶部
rem call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看视频按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
echo 点击看视频
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_shipin_y%
ping localhost -n 3 > nul



:shipinxun_huan
 
echo 暂停7秒 
ping localhost -n 7 > nul 

call %root_path%utils\utils_check_activity.bat %taobao_shipin%

echo 视频滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0
  
echo 运行开宝箱程序
call %root_path%pro_taobao\taobao_kaibaoxiang.bat 0

echo 运行全程序逻辑判断
call %root_path%alltask_check.bat 5


echo 判断视频时长
call :panduan_shipin_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo 重新循环视频程序
goto :shipinxun_huan
 

goto :eof

 
::=============== 
:panduan_shipin_time  
if not defined taobao_last_kai_zhi_bo_time ( 
	call :get_last_kai_zhi_bo_time
)  

set "taobao_now_kai_zhi_bo_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat taobao_now_kai_zhi_bo_time 


set /a "sec_count=%taobao_now_kai_zhi_bo_time%-%taobao_last_kai_zhi_bo_time%"
 
call %root_path%utils\utils_sp_get.bat taobao_kanshipin_long  
if %sec_count% lss %taobao_kanshipin_long% (
	set "sec_count=%taobao_kanshipin_long%"
)

call %root_path%utils\utils_sp_put.bat taobao_kanshipin_long %sec_count% 

echo 距离上次看视频时间：%sec_count%



if %sec_count% gtr %taobao_kanshipinzongshichang% (
	echo 可退出视频 
	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"
 
goto :eof

::=============== 
:get_last_kai_zhi_bo_time
call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time 
goto :eof

::=============== 
:the_end_exit  

adb -s %device_name% shell input keyevent 4  
ping localhost -n 1 > nul 

call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
call %root_path%utils\utils_sp_put.bat boo_taobao_kanshipin 0
 
echo "退出视频"
goto :eof
 
 


