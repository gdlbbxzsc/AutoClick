echo 运行看直播:%boo_douyin_kanzhibo%
if %boo_douyin_kanzhibo% equ 0 goto :eof

echo 点击去看直播
ping localhost -n 5 > nul
adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y% 
ping localhost -n 1 > nul
 
:zhiboxun_huan 

echo 暂停20秒
ping localhost -n 20 > nul 

echo 直播滑动翻页
adb -s %device_name% shell input swipe 10 477 10 0 

echo 运行直播红包程序
call %root_path%pro_douyin\douyin_kanzhibo_hongbao.bat 

echo 运行开宝箱程序
call %root_path%pro_douyin\douyin_kaibaoxiang.bat 1

echo 运行看广告程序
call %root_path%pro_douyin\douyin_qukanguanggao.bat 1

echo 运行吃饭程序
call %root_path%pro_douyin\douyin_chifan.bat 1

echo 运行睡觉程序
call %root_path%pro_douyin\douyin_shuijiao.bat 1

echo 运行全程序逻辑判断
call %root_path%alltask_check.bat 3

echo 判断直播时长
call :panduan_zhibo_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo 重新循环直播程序
goto :zhiboxun_huan
  
goto :eof

::=================== 
:panduan_zhibo_time  
if not defined douyin_last_kai_zhi_bo_time ( 
	call :get_last_kai_zhi_bo_time
)  

set "douyin_now_kai_zhi_bo_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_kai_zhi_bo_time 
 
set /a "sec_count=%douyin_now_kai_zhi_bo_time%-%douyin_last_kai_zhi_bo_time%"

call %root_path%utils\utils_sp_get.bat douyin_kanzhibo_long  
if %sec_count% lss %douyin_kanzhibo_long% (
	set "sec_count=%douyin_kanzhibo_long%"
)

call %root_path%utils\utils_sp_put.bat douyin_kanzhibo_long %sec_count% 

echo 距离上次直播时间：%sec_count%


if %sec_count% gtr %douyin_kanzhibozongshichang% ( 
	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"
 
goto :eof
 
::=================== 
:get_last_kai_zhi_bo_time
call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_time 
goto :eof

::=================== 
:the_end_exit  

adb -s %device_name% shell input keyevent 4
echo "退出直播"
 
set "douyin_last_kai_zhi_bo_time="  
set "douyin_now_kai_zhi_bo_time=" 

echo 修改任务状态0
call %root_path%utils\utils_sp_put.bat boo_douyin_kanzhibo 0
 

goto :eof
 
 