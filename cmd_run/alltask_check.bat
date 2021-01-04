rem @echo off 
rem 每二十分钟去做一次全部程序的宝箱广告任务
  
set "allday_param=%1"

 

call :alltask_douyinguanggao_panduan

call :alltask_douyinbaoxiang_panduan

call :alltask_kuaishoubaoxiang_panduan

 


goto :eof


::=====================================================================
:alltask_douyinguanggao_panduan

rem 如果当前程序为抖音则跳出
if %allday_param% equ 3 goto :eof



set "douyin_now_qu_kan_guang_gao_time=" 
call utils_gettimestamp_hms.bat douyin_now_qu_kan_guang_gao_time 

set /a "sec_count=%douyin_now_qu_kan_guang_gao_time%-%douyin_last_qu_kan_guang_gao_time%"
echo 距离上次去看广告时间：%sec_count%

if %sec_count% gtr %douyin_qukanguanggaorenwujiange% (
	echo 可以去看广告
	call :douyin_ke_kan_guang_gao
	goto :eof
)
::----------- 
goto :eof

::====================================
:alltask_douyinbaoxiang_panduan

rem 如果当前程序为抖音则跳出
if %allday_param% equ 3 goto :eof



set "douyin_now_kai_bao_xiang_time=" 
call utils_gettimestamp_hms.bat douyin_now_kai_bao_xiang_time 


set /a "sec_count=%douyin_now_kai_bao_xiang_time%-%douyin_last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %douyin_baoxiangjiange% (
	echo 可开宝箱 
	call :douyin_ke_kai_bao_xiang 
	goto :eof
) 


::----------
goto :eof

::====================================
:alltask_kuaishoubaoxiang_panduan

rem 如果当前程序为快手则跳出
if %allday_param% equ 4 goto :eof



set "kuaishou_now_kai_bao_xiang_time=" 
call utils_gettimestamp_hms.bat kuaishou_now_kai_bao_xiang_time 


set /a "sec_count=%kuaishou_now_kai_bao_xiang_time%-%kuaishou_last_kai_bao_xiang_time%"
echo 距离上次开宝箱时间：%sec_count%

if %sec_count% gtr %kuaishou_baoxiangjiange% (
	echo 可开宝箱 
	call :kuaishou_ke_kai_bao_xiang 
	goto :eof
) 
::----------
goto :eof


::====================================
:douyin_ke_kan_guang_gao   

echo 是否看广告任务%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 0 goto :eof

echo 点击home键到桌面
adb shell input keyevent 3
ping localhost -n 2 > nul

adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
ping localhost -n 6 > nul


call douyin_qukanguanggao.bat 0


call :back_to_now_app

goto :eof

::====================================
:douyin_ke_kai_bao_xiang   

echo 点击home键到桌面
adb shell input keyevent 3
ping localhost -n 2 > nul

adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
ping localhost -n 6 > nul


call douyin_kaibaoxiang.bat 0


call :back_to_now_app

goto :eof

::====================================
:kuaishou_ke_kai_bao_xiang   

echo 点击home键到桌面
adb shell input keyevent 3
ping localhost -n 2 > nul

adb -s %device_name% shell input tap %app_kuaishou_x% %app_kuaishou_y%
ping localhost -n 6 > nul


call kuaishou_kaibaoxiang.bat


call :back_to_now_app

goto :eof

 
 
::====================================
:back_to_now_app

rem 和 main.bat中配置的是一样的
rem echo 选择运行抖音程序 请输入3
rem echo 选择运行快手程序 请输入4
rem echo 选择运行淘宝程序 请输入5

if %allday_param% equ 3  adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y% 


if %allday_param% equ 4  adb -s %device_name% shell input tap %app_kuaishou_x% %app_kuaishou_y%


if %allday_param% equ 5  adb -s %device_name% shell input tap %app_taobao_x% %app_taobao_y%


goto :eof

