set "douyin_kaibaoxiang_param=%1"

call %root_path%utils\utils_sp_get.bat douyin_last_kai_bao_xiang_time  
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_kai_bao_xiang_time 


set /a "sec_count=%douyin_now_kai_bao_xiang_time%-%douyin_last_kai_bao_xiang_time%"
echo �����ϴο�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_baoxiangjiange% (
	echo �ɿ����� 
	call :ke_kai_bao_xiang 
) 
 
goto :eof
 

::================= 
:ke_kai_bao_xiang 



if %douyin_kaibaoxiang_param% equ 900 ( 
	rem ������Ϊȫ�����ж����ı����޸�
	set "alltask_has_run_result=1" 

	adb -s %device_name% shell  input keyevent 3
	ping localhost -n 1 > nul
	echo �������
	adb -s %device_name% shell input tap %app_douyin_x% %app_douyin_y%
	ping localhost -n 16 > nul
)

if %douyin_kaibaoxiang_param% equ 1 ( 
	echo �˳�ֱ��ȥ������
	adb -s %device_name% shell input keyevent 4 
	ping localhost -n 2 > nul
)
 
echo ȥ׬Ǯҳ��
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 10 > nul

echo �������
adb -s %device_name% shell input tap %douyin_tap_go_bao_xiang_x% %douyin_tap_go_bao_xiang_y%
ping localhost -n 6 > nul


if %boo_douyin_kanbaoxiangguanggao% equ 1 (
	echo ���������
	call :kekanbaoxiangguanggao
)

if %boo_douyin_kanbaoxiangguanggao% equ 0 (
	echo �رձ���
	adb -s %device_name% shell input tap %douyin_tap_close_bao_xiang_x% %douyin_tap_close_bao_xiang_y%
)

ping localhost -n 1 > nul

echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul

call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_kai_bao_xiang_time
call %root_path%utils\utils_sp_put.bat douyin_last_kai_bao_xiang_time %douyin_last_kai_bao_xiang_time%   


if %douyin_kaibaoxiang_param% equ 1 ( 
	echo �ص�ֱ��
	adb -s %device_name% shell input tap %douyin_tap_go_zhi_bo_x% %douyin_tap_go_zhi_bo_y%  
	ping localhost -n 1 > nul
) 

if %douyin_kaibaoxiang_param% equ 900 ( 
	echo �˳�����
	call %root_path%utils\utils_close.bat
)
goto :eof

::================= 
:kekanbaoxiangguanggao
adb -s %device_name% shell input tap %douyin_tap_go_bao_xiang_guang_gao_x% %douyin_tap_go_bao_xiang_guang_gao_y%
call %root_path%pro_douyin\douyin_kanguanggao.bat 36
goto :eof
 
 

 