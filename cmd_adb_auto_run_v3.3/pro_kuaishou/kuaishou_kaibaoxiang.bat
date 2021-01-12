echo 运行开宝箱任务:%boo_kuaishou_kaibaoxiang%
if %boo_kuaishou_kaibaoxiang% equ 0 goto :eof 


set "kuaishou_kaibaoxiang_param=%1"

call %root_path%utils\utils_sp_get.bat kuaishou_last_kai_bao_xiang_time  
if not defined kuaishou_last_kai_bao_xiang_time ( 
	call :get_kuaishou_last_kai_bao_xiang_time
)  

set "kuaishou_now_kai_bao_xiang_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_now_kai_bao_xiang_time 


set /a "sec_count=%kuaishou_now_kai_bao_xiang_time%-%kuaishou_last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %kuaishou_baoxiangjiange% (
	echo 可开宝箱 
	call :ke_kai_bao_xiang 
) 
 
goto :eof

::================ 
:get_kuaishou_last_kai_bao_xiang_time
call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_last_kai_bao_xiang_time 
goto :eof


::================ 
:ke_kai_bao_xiang 

if %kuaishou_kaibaoxiang_param% equ 900 ( 
	rem 这里是为全程序判断做的变量修改
	set "alltask_has_run_result=1" 
)
  
echo 去赚钱页面
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%
ping localhost -n 8 > nul


echo 点击宝箱
adb -s %device_name% shell input tap %kuaishou_tap_go_bao_xiang_x% %kuaishou_tap_go_bao_xiang_y%
ping localhost -n 5 > nul

echo 点击宝箱广告
adb -s %device_name% shell input tap %kuaishou_tap_go_bao_xiang_guang_gao_x% %kuaishou_tap_go_bao_xiang_guang_gao_y%
call %root_path%pro_kuaishou\kuaishou_kanguanggao.bat 36
 
echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_last_kai_bao_xiang_time
call %root_path%utils\utils_sp_put.bat kuaishou_last_kai_bao_xiang_time %kuaishou_last_kai_bao_xiang_time%   
 
if %kuaishou_kaibaoxiang_param% equ 900 ( 
	echo 退出程序
	call %root_path%utils\utils_close.bat
)

goto :eof

 

 