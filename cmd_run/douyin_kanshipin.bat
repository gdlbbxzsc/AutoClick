rem @echo off 
rem ѭ�� ����Ƶ 

echo ��ʼ����Ƶ  
 
:shipinxun_huan 

echo ��Ƶ��ͣ10�� 
ping localhost -n 10 > nul 

echo ��Ƶ������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0


echo ���п��������
call douyin_kaibaoxiang.bat 0 

echo �Ƿ񿴹������%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 1 call :shipinkekanguanggaorenwu

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
  
if not defined douyin_last_kai_shi_pin_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_shi_pin_time
)  

set "douyin_now_kai_shi_pin_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat douyin_now_kai_shi_pin_time
rem echo douyin_now_kai_shi_pin_time:%douyin_now_kai_shi_pin_time%


set /a "sec_count=%douyin_now_kai_shi_pin_time%-%douyin_last_kai_shi_pin_time%"
echo �����ϴο���Ƶʱ�䣺%sec_count%

if %sec_count% gtr %douyin_kanshipinzongshichang% (
	rem echo ���˳���Ƶ

	set "is_tui_shipin_bo=1"

	goto :eof
)

set "is_tui_shipin_bo=0"

rem pause
goto :eof
::====================================

:get_last_kai_shi_pin_time
call utils_gettimestamp_hms.bat douyin_last_kai_shi_pin_time
rem echo douyin_last_kai_shi_pin_time:%douyin_last_kai_shi_pin_time%
goto :eof

:the_end_exit 
rem set last_kai_shi_pin_time=%now_kai_shi_pin_time%+2
call utils_gettimestamp_hms.bat douyin_last_kai_shi_pin_time
rem adb -s %device_name% shell input keyevent 4
 
echo "���˳���Ƶ"
goto :eof

 
      
:shipinkekanguanggaorenwu
call douyin_qukanguanggao.bat 0
goto :eof 
