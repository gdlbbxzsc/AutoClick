rem @echo  off 
rem ѭ�� ��ֱ��

echo ���п�ֱ������
 
echo ���ȥ��ֱ��
ping localhost -n 2 > nul
adb -s %device_name% shell input tap %tap_go_zhi_bo_x% %tap_go_zhi_bo_y% 
ping localhost -n 1 > nul

echo ��ʼ��ֱ��  
 
:zhiboxun_huan 




echo ֱ��������ҳ
adb -s %device_name% shell input swipe 10 477 10 0 
ping localhost -n 30 > nul 

echo ����ֱ���������
call douyin_kanzhibo_hongbao.bat 

echo ���п��������
call douyin_kaibaoxiang.bat 1

echo �Ƿ񿴹������%boo_kanguanggao%
if %boo_kanguanggao% equ 1 call :zhibokekanguanggaorenwu

echo �ж�ֱ��ʱ��
call :panduan_zhibo_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo ����ѭ��ֱ������
goto :zhiboxun_huan
 
rem echo end-pause
rem pause 
goto :eof
::======================================

:panduan_zhibo_time 
rem �ж��Ƿ�����˳�ֱ�� ����Ϊ ������ʮ����
  
if not defined last_kai_zhi_bo_time (
	rem echo "go utils_gettimestamp_hmsp"
	call :get_last_kai_zhi_bo_time
)  

set "now_kai_zhi_bo_time="
rem echo "go utils_gettimestamp_hmsp"
call utils_gettimestamp_hms.bat now_kai_zhi_bo_time
rem echo now_kai_zhi_bo_time:%now_kai_zhi_bo_time%


set /a "sec_count=%now_kai_zhi_bo_time%-%last_kai_zhi_bo_time%"
rem echo �����ϴ�ֱ��ʱ�䣺%sec_count%

if %sec_count% gtr %kanzhibozongshichang% (
	rem echo ���˳�ֱ��

	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"

rem pause
goto :eof
====================================

:get_last_kai_zhi_bo_time
call utils_gettimestamp_hms.bat last_kai_zhi_bo_time
rem echo last_kai_zhi_bo_time:%last_kai_zhi_bo_time%
goto :eof

:the_end_exit 
rem set last_kai_zhi_bo_time=%now_kai_zhi_bo_time%+2
call utils_gettimestamp_hms.bat last_kai_zhi_bo_time
adb -s %device_name% shell input keyevent 4
 
echo "�˳�ֱ��"
goto :eof
 
:zhibokekanguanggaorenwu
call douyin_qukanguanggao.bat 1
goto :eof