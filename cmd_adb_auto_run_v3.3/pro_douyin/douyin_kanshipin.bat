echo ���п���Ƶ:%boo_douyin_kanshipin%
if %boo_douyin_kanshipin% equ 0 goto :eof

:shipinxun_huan 




echo ��Ƶ��ͣ7�� 
ping localhost -n 7 > nul 

call %root_path%utils\utils_check_activity.bat %douyin_shipin%

echo ��Ƶ������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0
 
echo ���п��������
call %root_path%pro_douyin\douyin_kaibaoxiang.bat 0 

echo ���п�������
call %root_path%pro_douyin\douyin_qukanguanggao.bat 0

echo ���п���Ʒ����
call %root_path%pro_douyin\douyin_qukanshangpin.bat 0

echo ���гԷ�����
call %root_path%pro_douyin\douyin_chifan.bat 0

echo ����˯������
call %root_path%pro_douyin\douyin_shuijiao.bat 0
 
echo ����ȫ�����߼��ж�
call %root_path%alltask_check.bat 3

echo �ж���Ƶʱ��
call :panduan_shipin_time

if %is_tui_shipin_bo% equ 1 goto :the_end_exit

goto :shipinxun_huan
  
goto :eof
 
::===================
:panduan_shipin_time 
if not defined douyin_last_kai_shi_pin_time ( 
	call :get_last_kai_shi_pin_time
)  

set "douyin_now_kai_shi_pin_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_kai_shi_pin_time 


set /a "sec_count=%douyin_now_kai_shi_pin_time%-%douyin_last_kai_shi_pin_time%"
 
call %root_path%utils\utils_sp_get.bat douyin_kanshipin_long  
if %sec_count% lss %douyin_kanshipin_long% (
	set "sec_count=%douyin_kanshipin_long%"
)

call %root_path%utils\utils_sp_put.bat douyin_kanshipin_long %sec_count% 

echo �����ϴο���Ƶʱ�䣺%sec_count%


if %sec_count% gtr %douyin_kanshipinzongshichang% (
	rem echo ���˳���Ƶ 
	set "is_tui_shipin_bo=1" 
	goto :eof
)

set "is_tui_shipin_bo=0"
 
goto :eof

::===================
:get_last_kai_shi_pin_time
call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_kai_shi_pin_time 
goto :eof

::===================
:the_end_exit   
rem adb -s %device_name% shell input keyevent 4
 
set "douyin_last_kai_shi_pin_time=" 
set "douyin_now_kai_shi_pin_time=" 

call %root_path%utils\utils_sp_put.bat boo_douyin_kanshipin 0
 
echo "���˳���Ƶ"
goto :eof

 
