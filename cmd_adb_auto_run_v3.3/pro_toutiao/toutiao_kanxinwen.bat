echo ��������:%boo_toutiao_kanxinwen%
if %boo_toutiao_kanxinwen% equ 0 goto :eof
  
echo ���������
adb -s %device_name% shell input tap %toutiao_tap_go_kan_xin_wen_x% %toutiao_tap_go_kan_xin_wen_y%
ping localhost -n 3 > nul

echo ���������tab
adb -s %device_name% shell input tap %toutiao_tap_go_kan_xin_wen_tab_x% %toutiao_tap_go_kan_xin_wen_tab_y%
ping localhost -n 1 > nul
 
:xinwenxun_huan

call %root_path%utils\utils_check_activity.bat %toutiao_xinwen%
   
echo �����б�����ҳ 
adb -s %device_name% shell input swipe 10 800 10 0 
 
echo ������� 
adb -s %device_name% shell input tap 333 1000
ping localhost -n 5 > nul 

 adb -s %device_name% shell input swipe 10 999 10 77
 ping localhost -n 4 > nul 
 adb -s %device_name% shell input swipe 10 999 10 77
 ping localhost -n 4 > nul 
 adb -s %device_name% shell input swipe 10 999 10 77
 ping localhost -n 4 > nul 
 adb -s %device_name% shell input swipe 10 999 10 77
 ping localhost -n 4 > nul 
 adb -s %device_name% shell input swipe 10 999 10 77
 ping localhost -n 4 > nul 

echo �˳�����
adb -s %device_name% shell input keyevent 4 
 
echo ���п��������
call %root_path%pro_toutiao\toutiao_kaibaoxiang.bat 0

echo ���п���Ʒ����
call %root_path%pro_toutiao\toutiao_qukanshangpin.bat 0
 
echo ����ȫ�����߼��ж�
call %root_path%alltask_check.bat 5


echo �ж�����ʱ��
call :panduan_xinwen_time

if %is_tui_chu_xin_wen% equ 1 goto :the_end_exit

echo ����ѭ�����ų���
goto :xinwenxun_huan
 

goto :eof

 
::================  
:panduan_xinwen_time  
if not defined toutiao_last_kai_xin_wen_time ( 
	call :get_last_kai_xin_wen_time
)  

set "toutiao_now_kai_xin_wen_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat toutiao_now_kai_xin_wen_time 


set /a "sec_count=%toutiao_now_kai_xin_wen_time%-%toutiao_last_kai_xin_wen_time%"
 
call %root_path%utils\utils_sp_get.bat toutiao_xinwen_long  
if %sec_count% lss %toutiao_xinwen_long% (
	set "sec_count=%toutiao_xinwen_long%"
)

call %root_path%utils\utils_sp_put.bat toutiao_xinwen_long %sec_count% 


echo �����ϴ�����ʱ�䣺%sec_count%

if %sec_count% gtr %toutiao_kanxinwenzongshichang% (
	echo ���˳����� 
	set "is_tui_chu_xin_wen=1"
	goto :eof
)
set "is_tui_chu_xin_wen=0"
 
goto :eof

::====================  
:get_last_kai_xin_wen_time
call %root_path%utils\utils_gettimestamp_hms.bat toutiao_last_kai_xin_wen_time 
goto :eof


::==================== 
:the_end_exit  
call %root_path%utils\utils_gettimestamp_hms.bat toutiao_last_kai_xin_wen_time 
ping localhost -n 1 > nul 

call %root_path%utils\utils_sp_put.bat boo_toutiao_kanxinwen 0
 
echo "�˳�����"
goto :eof
 
 


