echo ���п�ֱ��:%boo_taobao_kanzhibo%
if %boo_taobao_kanzhibo% equ 0 goto :eof
  
rem echo ��ȥ׬Ǯ����������
rem call %root_path%utils\utils_huadongdingbu.bat   

echo ����������Ƶ��ť
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zhibo_y% 10 0 

 
echo �����ֱ��
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_zhibo_y% 
ping localhost -n 3 > nul
 
:zhiboxun_huan

echo ��ͣ20�� 
ping localhost -n 18 > nul 

call %root_path%utils\utils_check_activity.bat %taobao_zhibo%
  
adb -s %device_name% shell input swipe %taobao_swipe_xiuxi_zhibo_x1% %taobao_swipe_xiuxi_zhibo_y% %taobao_swipe_xiuxi_zhibo_x2% %taobao_swipe_xiuxi_zhibo_y%
ping localhost -n 1 > nul 

adb -s %device_name% shell input swipe %taobao_swipe_xiuxi_zhibo_x2% %taobao_swipe_xiuxi_zhibo_y% %taobao_swipe_xiuxi_zhibo_x1% %taobao_swipe_xiuxi_zhibo_y%
ping localhost -n 1 > nul 

echo ֱ��������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0
   
echo ���п��������
call %root_path%pro_taobao\taobao_kaibaoxiang.bat 1


echo ����ȫ�����߼��ж�
call %root_path%alltask_check.bat 5


echo �ж�ֱ��ʱ��
call :panduan_zhibo_time

if %is_tui_chu_zhi_bo% equ 1 goto :the_end_exit

echo ����ѭ��ֱ������
goto :zhiboxun_huan
 

goto :eof

 
::================== 
:panduan_zhibo_time  
if not defined taobao_last_kai_zhi_bo_time ( 
	call :get_last_kai_zhi_bo_time
)  

set "taobao_now_kai_zhi_bo_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat taobao_now_kai_zhi_bo_time 


set /a "sec_count=%taobao_now_kai_zhi_bo_time%-%taobao_last_kai_zhi_bo_time%"

call %root_path%utils\utils_sp_get.bat taobao_kanzhibo_long  
if %sec_count% lss %taobao_kanzhibo_long% (
	set "sec_count=%taobao_kanzhibo_long%"
)

call %root_path%utils\utils_sp_put.bat taobao_kanzhibo_long %sec_count% 

echo �����ϴ�ֱ��ʱ�䣺%sec_count%



if %sec_count% gtr %taobao_kanzhibozongshichang% (
	echo ���˳�ֱ�� 
	set "is_tui_chu_zhi_bo=1"
	goto :eof
)
set "is_tui_chu_zhi_bo=0"
 
goto :eof

::================== 
:get_last_kai_zhi_bo_time
call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time 
goto :eof

::================== 
:the_end_exit   
adb -s %device_name% shell input keyevent 4 
ping localhost -n 2 > nul 

call %root_path%utils\utils_gettimestamp_hms.bat taobao_last_kai_zhi_bo_time
call %root_path%utils\utils_sp_put.bat boo_taobao_kanzhibo 0
 
echo "�˳�ֱ��"
goto :eof
 
 


