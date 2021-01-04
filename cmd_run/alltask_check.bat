rem @echo off 
rem ÿ��ʮ����ȥ��һ��ȫ������ı���������
  
set "allday_param=%1"

 

call :alltask_douyinguanggao_panduan

call :alltask_douyinbaoxiang_panduan

call :alltask_kuaishoubaoxiang_panduan

 


goto :eof


::=====================================================================
:alltask_douyinguanggao_panduan

rem �����ǰ����Ϊ����������
if %allday_param% equ 3 goto :eof



set "douyin_now_qu_kan_guang_gao_time=" 
call utils_gettimestamp_hms.bat douyin_now_qu_kan_guang_gao_time 

set /a "sec_count=%douyin_now_qu_kan_guang_gao_time%-%douyin_last_qu_kan_guang_gao_time%"
echo �����ϴ�ȥ�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_qukanguanggaorenwujiange% (
	echo ����ȥ�����
	call :douyin_ke_kan_guang_gao
	goto :eof
)
::----------- 
goto :eof

::====================================
:alltask_douyinbaoxiang_panduan

rem �����ǰ����Ϊ����������
if %allday_param% equ 3 goto :eof



set "douyin_now_kai_bao_xiang_time=" 
call utils_gettimestamp_hms.bat douyin_now_kai_bao_xiang_time 


set /a "sec_count=%douyin_now_kai_bao_xiang_time%-%douyin_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_baoxiangjiange% (
	echo �ɿ����� 
	call :douyin_ke_kai_bao_xiang 
	goto :eof
) 


::----------
goto :eof

::====================================
:alltask_kuaishoubaoxiang_panduan

rem �����ǰ����Ϊ����������
if %allday_param% equ 4 goto :eof



set "kuaishou_now_kai_bao_xiang_time=" 
call utils_gettimestamp_hms.bat kuaishou_now_kai_bao_xiang_time 


set /a "sec_count=%kuaishou_now_kai_bao_xiang_time%-%kuaishou_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %kuaishou_baoxiangjiange% (
	echo �ɿ����� 
	call :kuaishou_ke_kai_bao_xiang 
	goto :eof
) 
::----------
goto :eof


::====================================
:douyin_ke_kan_guang_gao   

echo �Ƿ񿴹������%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 0 goto :eof

echo ���home��������
adb shell input keyevent 3
ping localhost -n 2 > nul

adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
ping localhost -n 6 > nul


call douyin_qukanguanggao.bat 0


call :back_to_now_app

goto :eof

::====================================
:douyin_ke_kai_bao_xiang   

echo ���home��������
adb shell input keyevent 3
ping localhost -n 2 > nul

adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
ping localhost -n 6 > nul


call douyin_kaibaoxiang.bat 0


call :back_to_now_app

goto :eof

::====================================
:kuaishou_ke_kai_bao_xiang   

echo ���home��������
adb shell input keyevent 3
ping localhost -n 2 > nul

adb -s %device_name% shell input tap %app_kuaishou_x% %app_kuaishou_y%
ping localhost -n 6 > nul


call kuaishou_kaibaoxiang.bat


call :back_to_now_app

goto :eof

 
 
::====================================
:back_to_now_app

rem �� main.bat�����õ���һ����
rem echo ѡ�����ж������� ������3
rem echo ѡ�����п��ֳ��� ������4
rem echo ѡ�������Ա����� ������5

if %allday_param% equ 3  adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y% 


if %allday_param% equ 4  adb -s %device_name% shell input tap %app_kuaishou_x% %app_kuaishou_y%


if %allday_param% equ 5  adb -s %device_name% shell input tap %app_taobao_x% %app_taobao_y%


goto :eof

