echo ������·:%boo_taobao_zoulu%
if %boo_taobao_zoulu% equ 0 goto :eof
 
echo ��ȥ׬Ǯ���������� 
call %root_path%utils\utils_huadongdingbu.bat  
  
echo ��������·��ť
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0 
 
echo �����·
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_zoulu_y%
ping localhost -n 4 > nul
 
echo �����·����
adb -s %device_name% shell input tap %taobao_tap_song_zoulu_x% %taobao_tap_song_zoulu_y%
ping localhost -n 1 > nul


echo �����·��Ǯ
adb -s %device_name% shell input tap %taobao_tap_shou_zoulu_x% %taobao_tap_shou_zoulu_y% 
ping localhost -n 1 > nul

echo �˳���·
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul 

call %root_path%utils\utils_sp_put.bat boo_taobao_zoulu 0

goto :eof

 
  




