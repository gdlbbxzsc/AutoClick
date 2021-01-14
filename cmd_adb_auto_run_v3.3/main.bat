  @echo off 
setlocal enabledelayedexpansion

set "root_path=%~dp0"
echo root_path:%root_path%

:retry 

title auto_run
 
 
rem ѡ���豸
call %root_path%utils\utils_choose_device.bat 
if not defined device_name ( 
	goto retry
) 

 
title %device_name%

rem ������Ϣ
call %root_path%base_config\config.bat

rem ��ȡ�ֱ�����Ϣ
call %root_path%utils\utils_config_screen_load.bat

rem ����log��־λ��
set "log_path=%root_path%base_config\custom\%device_name%\log.txt"  

 
:choose_run_command

echo =======================
echo ��ѡ�������
echo �������� h
echo �鿴���� c
echo ---
echo ȫ����	a 
echo ȫ����	b 
echo ��������	3 [r] 
echo ���ֳ���	4 [r] 
echo �Ա�����	5 [r] 
echo ͷ������	6 [r]
echo ---
echo ��ѡ 0 
echo =======================

set /p main_input=�����룺 

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

	echo ����ȫ�����߼��ж�
	call %root_path%alltask_check.bat 0
 
	echo "%device_name%-b�������" >%log_path%
	start %log_path%

	goto choose_run_command
)

if "%main_input%"=="a" ( 

	title %device_name%-all

	call %root_path%pro_taobao\taobao_run.bat %reload% 0 
	call %root_path%pro_douyin\douyin_run.bat %reload% 0 
	call %root_path%pro_kuaishou\kuaishou_run.bat %reload% 0 
	call %root_path%pro_toutiao\toutiao_run.bat %reload% 0
 
	echo "%device_name%-all�������" >%log_path%
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

rem 400:�������ʲôҲ����
rem 90x:����������б�����ȶ�ʱ����
 
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
 
echo "%device_name%-%main_input%�������" >%log_path%
start %log_path%

goto choose_run_command
 