echo ������·:%boo_douyin_zoulu%
if %boo_douyin_zoulu% equ 0 goto :eof

echo ���ȥ׬Ǯ
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 6 > nul

echo ��ȥ׬Ǯ���������� 
call %root_path%utils\utils_huadongdingbu.bat  
  
echo ��������·��ť
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_zoulu_y% 10 0 

echo �����·
adb -s %device_name% shell input tap %douyin_tap_task_x% %douyin_tap_go_zoulu_y%
ping localhost -n 5 > nul

echo �����·��Ǯ
adb -s %device_name% shell input tap %center_x% %douyin_tap_shou_zoulu_y% 
ping localhost -n 1 > nul

echo �˳���·
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul 

echo �޸�����״̬0
call %root_path%utils\utils_sp_put.bat boo_douyin_zoulu 0

goto :eof

 
  




