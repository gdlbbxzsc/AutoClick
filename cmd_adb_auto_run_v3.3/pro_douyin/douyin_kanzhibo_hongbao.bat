if not defined douyin_last_kai_zhi_bo_hong_bao_time ( 
	call :get_last_kai_zhi_bo_hong_bao_time
)  

set "douyin_now_kai_zhi_bo_hong_bao_time=" 
call %root_path%utils\utils_gettimestamp_hms.bat douyin_now_kai_zhi_bo_hong_bao_time 


set /a "sec_count=%douyin_now_kai_zhi_bo_hong_bao_time%-%douyin_last_kai_zhi_bo_hong_bao_time%"
echo �����ϴο�ֱ�����ʱ�䣺%sec_count%

if %sec_count% gtr %douyin_shouzhibohongbaojiange% ( 
	call :ke_kai_zhi_bo_hong_bao 
) 
goto :eof

::======================  
:get_last_kai_zhi_bo_hong_bao_time
call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_hong_bao_time 
goto :eof

::======================  
:ke_kai_zhi_bo_hong_bao  

echo ���ֱ�����
adb -s %device_name% shell input tap %douyin_tap_zhi_bo_hongbao_x% %douyin_tap_zhi_bo_hongbao_y% 
ping localhost -n 7 > nul 

echo ����ֱ�����
adb -s %device_name% shell input tap %douyin_tap_zhi_bo_hongbao_get_x% %douyin_tap_zhi_bo_hongbao_get_y%

call %root_path%utils\utils_gettimestamp_hms.bat douyin_last_kai_zhi_bo_hong_bao_time

echo ��ֱ��������
  
goto :eof

 

 