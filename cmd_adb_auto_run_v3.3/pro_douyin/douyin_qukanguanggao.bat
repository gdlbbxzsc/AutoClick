echo �Ƿ񿴹������%boo_douyin_kanguanggao%
if %boo_douyin_kanguanggao% equ 0 goto :eof

  
set "douyin_qukanguanggao_param=%1"

call %root_path%utils\utils_sp_get.bat douyin_last_qu_kan_guang_gao_time  
if not defined douyin_last_qu_kan_guang_gao_time ( 
	call :get_douyin_last_qu_kan_guang_gao_time
)  

set "douyin_now_qu_kan_guang_gao_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_qu_kan_guang_gao_time 

set /a "sec_count=%douyin_now_qu_kan_guang_gao_time%-%douyin_last_qu_kan_guang_gao_time%"
echo �����ϴ�ȥ�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_qukanguanggaorenwujiange% (
	echo ����ȥ�����
	call :ke_kan_guang_gao 
)
  
goto :eof

::================== 
:get_douyin_last_qu_kan_guang_gao_time
call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time 
goto :eof

::==================
:ke_kan_guang_gao  

if %douyin_qukanguanggao_param% equ 900 ( 
	rem ������Ϊȫ�����ж����ı����޸�
	set "alltask_has_run_result=1" 
)

if %douyin_qukanguanggao_param% equ 1 ( 
	echo �˳�ֱ��ȥ������
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 1 > nul
)

echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 10 > nul

echo ��ȥ׬Ǯ����������
call %root_path%utils\utils_huadongdingbu.bat 

echo ��������水ť
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0 
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_guanggao_y% 10 0

 
echo ������
adb -s %device_name% shell input tap %douyin_tap_task_x% %douyin_tap_go_guang_gao_y%
  
call %root_path%pro_douyin\douyin_kanguanggao.bat 36
 
echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_qu_kan_guang_gao_time
call %root_path%utils\utils_sp_put.bat douyin_last_qu_kan_guang_gao_time %douyin_last_qu_kan_guang_gao_time%   


if %douyin_qukanguanggao_param% equ 1 ( 
	echo �ص�ֱ��
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

if %douyin_qukanguanggao_param% equ 900 ( 
	echo �˳�����
	call %root_path%utils\utils_close.bat
)

goto :eof

 

 