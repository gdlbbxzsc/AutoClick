rem @echo off 
  
echo ��ȥ׬Ǯ����������
call common_huadongdingbu.bat   

rem echo ����������Ƶ��ť
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
rem echo �������Ƶ
adb -s %device_name% shell input tap %taobao_tap_go_shipin_x% %taobao_tap_go_shipin_y%
  
ping localhost -n 3 > nul

echo ��ʼ����Ƶ  

:shipinxun_huan

set /a m+=1

echo ��Ƶ������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0
  
echo ��ͣ20�� 
ping localhost -n 20 > nul 

 
echo ���п��������
call taobao_kaibaoxiang.bat 0


echo ����ȫ�����߼��ж�
call alltask_check.bat 5


echo �ж���Ƶʱ��
call :panduan_shipin_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo ����ѭ����Ƶ����
goto :shipinxun_huan
 

goto :eof

 
::======================================

:panduan_shipin_time 
rem �ж��Ƿ�����˳���Ƶ ����Ϊ ������ʮ����
  
if not defined taobao_last_kai_zhi_bo_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_time
)  

set "taobao_now_kai_zhi_bo_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat taobao_now_kai_zhi_bo_time
rem echo now_kai_zhi_bo_time:%now_kai_zhi_bo_time%


set /a "sec_count=%taobao_now_kai_zhi_bo_time%-%taobao_last_kai_zhi_bo_time%"
rem echo �����ϴ���Ƶʱ�䣺%sec_count%

if %sec_count% gtr %taobao_kanshipinzongshichang% (
	rem echo ���˳���Ƶ

	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"

rem pause
goto :eof
::====================================

:get_last_kai_zhi_bo_time
call utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
rem echo last_kai_zhi_bo_time:%taobao_last_kai_zhi_bo_time%
goto :eof

:the_end_exit 
rem set last_kai_zhi_bo_time=%now_kai_zhi_bo_time%+2
call utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
adb -s %device_name% shell input keyevent 4 
ping localhost -n 1 > nul 
 
echo "�˳���Ƶ"
goto :eof
 
 


