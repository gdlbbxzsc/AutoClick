echo ���п���Ƶ:%boo_taobao_kanshipin%
if %boo_taobao_kanshipin% equ 0 goto :eof 


rem echo ��ȥ׬Ǯ����������
rem call %root_path%utils\utils_huadongdingbu.bat   

echo ����������Ƶ��ť
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_shipin_y% 10 0 

 
echo �������Ƶ
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_shipin_y%
ping localhost -n 3 > nul



:shipinxun_huan
 
echo ��ͣ7�� 
ping localhost -n 7 > nul 

call %root_path%utils\utils_check_activity.bat %taobao_shipin%

echo ��Ƶ������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0
  
echo ���п��������
call %root_path%pro_taobao\taobao_kaibaoxiang.bat 0

echo ����ȫ�����߼��ж�
call %root_path%alltask_check.bat 5


echo �ж���Ƶʱ��
call :panduan_shipin_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo ����ѭ����Ƶ����
goto :shipinxun_huan
 

goto :eof

 
::=============== 
:panduan_shipin_time  
if not defined taobao_last_kai_zhi_bo_time ( 
	call :get_last_kai_zhi_bo_time
)  

set "taobao_now_kai_zhi_bo_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat taobao_now_kai_zhi_bo_time 


set /a "sec_count=%taobao_now_kai_zhi_bo_time%-%taobao_last_kai_zhi_bo_time%"
 
call %root_path%utils\utils_sp_get.bat taobao_kanshipin_long  
if %sec_count% lss %taobao_kanshipin_long% (
	set "sec_count=%taobao_kanshipin_long%"
)

call %root_path%utils\utils_sp_put.bat taobao_kanshipin_long %sec_count% 

echo �����ϴο���Ƶʱ�䣺%sec_count%



if %sec_count% gtr %taobao_kanshipinzongshichang% (
	echo ���˳���Ƶ 
	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"
 
goto :eof

::=============== 
:get_last_kai_zhi_bo_time
call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time 
goto :eof

::=============== 
:the_end_exit  

adb -s %device_name% shell input keyevent 4  
ping localhost -n 1 > nul 

call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
call %root_path%utils\utils_sp_put.bat boo_taobao_kanshipin 0
 
echo "�˳���Ƶ"
goto :eof
 
 


