  @echo off 
setlocal enabledelayedexpansion

set "root_path=%~dp0"
echo root_path:%root_path%

:retry 

title auto_run
 
 
rem 选择设备
call %root_path%utils\utils_choose_device.bat 
if not defined device_name ( 
	goto retry
) 

 
title %device_name%

rem 配置信息
call %root_path%base_config\config.bat

rem 读取分辨率信息
call %root_path%utils\utils_config_screen_load.bat

rem 设置log日志位置
set "log_path=%root_path%base_config\custom\%device_name%\log.txt"  

 
:choose_run_command

echo =======================
echo 请选择操作：
echo 滑动测试 h
echo 查看界面 c
echo ---
echo 全程序	a 
echo 全任务	b 
echo 抖音程序	3 [r] 
echo 快手程序	4 [r] 
echo 淘宝程序	5 [r] 
echo 头条程序	6 [r]
echo ---
echo 重选 0 
echo =======================

set /p main_input=请输入： 

if "%main_input%"=="0" (
	goto retry
)

if "%main_input%"=="h" (
	call %root_path%utils\utils_huadongceshi.bat
	goto choose_run_command
) 

if "%main_input%"=="c" (
	for /F "tokens=2* delims={}" %%i in ('adb -s %device_name% shell dumpsys activity ^| findstr "mFocusedActivity"') do (
		echo now_activity=%%i
	)
	goto choose_run_command
) 



if "%main_input%"=="b" ( 

	title %device_name%-b

	echo 运行全程序逻辑判断
	call %root_path%alltask_check.bat 0
 
	echo "%device_name%-b运行完成" >%log_path%
	start %log_path%

	goto choose_run_command
)

if "%main_input%"=="a" ( 

	title %device_name%-all

	call %root_path%pro_taobao\taobao_run.bat %reload% 0 
	call %root_path%pro_douyin\douyin_run.bat %reload% 0 
	call %root_path%pro_kuaishou\kuaishou_run.bat %reload% 0 
	call %root_path%pro_toutiao\toutiao_run.bat %reload% 0
 
	echo "%device_name%-all运行完成" >%log_path%
	start %log_path%

	goto choose_run_command
)

::=================================
title %device_name%-%main_input%

set "first=%main_input:~0,1%" 
set "last=%main_input:~-1%" 

set "reload=r"
if "%first%"=="%last%" ( 
	set "reload=0"
)

rem 400:点击程序什么也不做
rem 90x:点击程序运行宝箱广告等定时任务
 
if "%first%"=="3" ( 
	call %root_path%pro_douyin\douyin_run.bat %reload% 0
)

if "%first%"=="4" ( 
	call %root_path%pro_kuaishou\kuaishou_run.bat %reload% 0
)

if "%first%"=="5" ( 
	call %root_path%pro_taobao\taobao_run.bat %reload% 0
)

if "%first%"=="6" ( 
	call %root_path%pro_toutiao\toutiao_run.bat %reload% 0
)
 
echo "%device_name%-%main_input%运行完成" >%log_path%
start %log_path%

goto choose_run_command
 