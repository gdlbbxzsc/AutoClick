echo ���п���������:%boo_kuaishou_kaibaoxiang%
if %boo_kuaishou_kaibaoxiang% equ 0 goto :eof 


set "kuaishou_kaibaoxiang_param=%1"

call %root_path%utils\utils_sp_get.bat kuaishou_last_kai_bao_xiang_time  
if not defined kuaishou_last_kai_bao_xiang_time ( 
	call :get_kuaishou_last_kai_bao_xiang_time
)  

set "kuaishou_now_kai_bao_xiang_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_now_kai_bao_xiang_time 


set /a "sec_count=%kuaishou_now_kai_bao_xiang_time%-%kuaishou_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %kuaishou_baoxiangjiange% (
	echo �ɿ����� 
	call :ke_kai_bao_xiang 
) 
 
goto :eof

::================ 
:get_kuaishou_last_kai_bao_xiang_time
call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_last_kai_bao_xiang_time 
goto :eof


::================ 
:ke_kai_bao_xiang 

if %kuaishou_kaibaoxiang_param% equ 900 ( 
	rem ������Ϊȫ�����ж����ı����޸�
	set "alltask_has_run_result=1" 
)
  
echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%
ping localhost -n 8 > nul


echo �������
adb -s %device_name% shell input tap %kuaishou_tap_go_bao_xiang_x% %kuaishou_tap_go_bao_xiang_y%
ping localhost -n 5 > nul

echo ���������
adb -s %device_name% shell input tap %kuaishou_tap_go_bao_xiang_guang_gao_x% %kuaishou_tap_go_bao_xiang_guang_gao_y%
call %root_path%pro_kuaishou\kuaishou_kanguanggao.bat 36
 
echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat kuaishou_last_kai_bao_xiang_time
call %root_path%utils\utils_sp_put.bat kuaishou_last_kai_bao_xiang_time %kuaishou_last_kai_bao_xiang_time%   
 
if %kuaishou_kaibaoxiang_param% equ 900 ( 
	echo �˳�����
	call %root_path%utils\utils_close.bat
)

goto :eof

 

 