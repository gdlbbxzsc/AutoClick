rem @echo off 
rem ѭ�� ����Ƶ 

echo ��ʼ����Ƶ  
 
:shipinxun_huan 

echo ��Ƶ��ͣ15�� 
ping localhost -n 15 > nul 
 
echo �������������Ƶ��ť
adb -s %device_name% shell input tap %tap_jixubofangshipin_x% %tap_jixubofangshipin_y%

echo ��Ƶ������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0


echo ���п��������
call kuaishou_kaibaoxiang.bat


echo �ж���Ƶʱ��
call :panduan_shipin_time

if %is_tui_shipin_bo% equ 1 goto :the_end_exit

goto :shipinxun_huan
 
rem echo end-pause
rem pause 
goto :eof
::======================================


 

:panduan_shipin_time
 rem �ж��Ƿ�����˳���Ƶ ����Ϊ ����180����
  
if not defined last_kai_shi_pin_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_shi_pin_time
)  

set "now_kai_shi_pin_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_shi_pin_time
rem echo now_kai_shi_pin_time:%now_kai_shi_pin_time%


set /a "sec_count=%now_kai_shi_pin_time%-%last_kai_shi_pin_time%"
echo �����ϴο���Ƶʱ�䣺%sec_count%

if %sec_count% gtr %kanshipinzongshichang% (
	rem echo ���˳���Ƶ

	set "is_tui_shipin_bo=1"

	goto :eof
)

set "is_tui_shipin_bo=0"

rem pause
goto :eof
::====================================

:get_last_kai_shi_pin_time
call utils_gettimestamp_hms.bat last_kai_shi_pin_time
rem echo last_kai_shi_pin_time:%last_kai_shi_pin_time%
goto :eof

:the_end_exit 
rem set last_kai_shi_pin_time=%now_kai_shi_pin_time%+2
call utils_gettimestamp_hms.bat last_kai_shi_pin_time
rem adb -s %device_name% shell input keyevent 4
 
echo "���˳���Ƶ"
goto :eof

  