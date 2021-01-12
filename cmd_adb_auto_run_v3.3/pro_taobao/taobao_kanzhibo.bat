echo 运行看直播:%boo_taobao_kanzhibo%
if %boo_taobao_kanzhibo% equ 0 goto :eof
  
echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看直播按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0 

 
echo 点击看直播
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_zhibo_y% 
ping localhost -n 3 > nul
 
:zhiboxun_huan

echo 暂停20秒 
ping localhost -n 18 > nul 

call %root_path%utils\utils_check_activity.bat %taobao_zhibo%
  
adb -s %device_name% shell input swipe %taobao_swipe_xiuxi_zhibo_x1% %taobao_swipe_xiuxi_zhibo_y% %taobao_swipe_xiuxi_zhibo_x2% %taobao_swipe_xiuxi_zhibo_y%
ping localhost -n 1 > nul 

adb -s %device_name% shell input swipe %taobao_swipe_xiuxi_zhibo_x2% %taobao_swipe_xiuxi_zhibo_y% %taobao_swipe_xiuxi_zhibo_x1% %taobao_swipe_xiuxi_zhibo_y%
ping localhost -n 1 > nul 

echo 直播滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0
   
echo 运行开宝箱程序
call %root_path%pro_taobao\taobao_kaibaoxiang.bat 1


echo 运行全程序逻辑判断
call %root_path%alltask_check.bat 5


echo 判断直播时长
call :panduan_zhibo_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo 重新循环直播程序
goto :zhiboxun_huan
 

goto :eof

 
::================== 
:panduan_zhibo_time  
if not defined taobao_last_kai_zhi_bo_time ( 
	call :get_last_kai_zhi_bo_time
)  

set "taobao_now_kai_zhi_bo_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat taobao_now_kai_zhi_bo_time 


set /a "sec_count=%taobao_now_kai_zhi_bo_time%-%taobao_last_kai_zhi_bo_time%"

call %root_path%utils\utils_sp_get.bat taobao_kanzhibo_long  
if %sec_count% lss %taobao_kanzhibo_long% (
	set "sec_count=%taobao_kanzhibo_long%"
)

call %root_path%utils\utils_sp_put.bat taobao_kanzhibo_long %sec_count% 

echo 距离上次直播时间：%sec_count%



if %sec_count% gtr %taobao_kanzhibozongshichang% (
	echo 可退出直播 
	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"
 
goto :eof

::================== 
:get_last_kai_zhi_bo_time
call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time 
goto :eof

::================== 
:the_end_exit   
adb -s %device_name% shell input keyevent 4 
ping localhost -n 2 > nul 

call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
call %root_path%utils\utils_sp_put.bat boo_taobao_kanzhibo 0
 
echo "退出直播"
goto :eof
 
 


