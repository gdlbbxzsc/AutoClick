set "toutiao_kaibaoxiang_param=%1"

call %root_path%utils\utils_sp_get.bat toutiao_last_kai_bao_xiang_time 

if not defined toutiao_last_kai_bao_xiang_time ( 
	call :get_toutiao_last_kai_bao_xiang_time
)  

set "toutiao_now_kai_bao_xiang_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat toutiao_now_kai_bao_xiang_time 


set /a "sec_count=%toutiao_now_kai_bao_xiang_time%-%toutiao_last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %toutiao_baoxiangjiange% (
	echo 可开宝箱 
	call :ke_kai_bao_xiang 
) 
 
goto :eof

::================= 
:get_toutiao_last_kai_bao_xiang_time
call %root_path%utils\utils_gettimestamp_hms.bat toutiao_last_kai_bao_xiang_time 
goto :eof

::================= 
:ke_kai_bao_xiang 
if %toutiao_kaibaoxiang_param% equ 0 (  
	echo 点击去赚钱
	adb -s %device_name% shell input tap %toutiao_tap_go_zhuan_qian_x% %toutiao_tap_go_zhuan_qian_y%
	ping localhost -n 6 > nul
)
 
 
echo 点击宝箱
adb -s %device_name% shell input tap %toutiao_tap_go_bao_xiang_x% %toutiao_tap_go_bao_xiang_y%
ping localhost -n 6 > nul


adb -s %device_name% shell input tap %toutiao_tap_go_bao_xiang_guang_gao_x% %toutiao_tap_go_bao_xiang_guang_gao_y%
call %root_path%pro_toutiao\toutiao_kanguanggao.bat 26
 

call %root_path%utils\utils_gettimestamp_hms.bat toutiao_last_kai_bao_xiang_time
call %root_path%utils\utils_sp_put.bat toutiao_last_kai_bao_xiang_time %toutiao_last_kai_bao_xiang_time%   

if %toutiao_kaibaoxiang_param% equ 0 (  
	echo 点击看新闻
	adb -s %device_name% shell input tap %toutiao_tap_go_kan_xin_wen_x% %toutiao_tap_go_kan_xin_wen_y%
	ping localhost -n 4 > nul
)
goto :eof
 
 

 