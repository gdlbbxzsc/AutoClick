echo ������·:%boo_toutiao_zoulu%
if %boo_toutiao_zoulu% equ 0 goto :eof 

echo ���ȥ׬Ǯ
adb -s %device_name% shell input tap %toutiao_tap_go_zhuan_qian_x% %toutiao_tap_go_zhuan_qian_y%
ping localhost -n 2 > nul

echo ��ȥ׬Ǯ���������� 
call %root_path%utils\utils_huadongdingbu.bat  
  
  
echo �����·
adb -s %device_name% shell input tap %toutiao_tap_go_zoulu_x% %toutiao_tap_go_zoulu_y%
ping localhost -n 6 > nul

echo �����·��Ǯ
adb -s %device_name% shell input tap %toutiao_tap_shou_zoulu_x% %toutiao_tap_shou_zoulu_y% 
ping localhost -n 1 > nul

echo �˳���·
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

call %root_path%utils\utils_sp_put.bat boo_toutiao_zoulu 0

goto :eof

 
  




