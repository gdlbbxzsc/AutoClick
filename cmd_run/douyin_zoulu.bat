rem @echo off 

adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo ��ȥ׬Ǯ���������� 
call common_huadongdingbu.bat  
  


rem echo ��������·��ť
adb -s %device_name% shell input swipe 10 %swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_zoulu_y% 10 0 


 
rem echo �����·
adb -s %device_name% shell input tap %tap_go_zoulu_x% %tap_go_zoulu_y%
  
ping localhost -n 3 > nul

rem echo �����·��Ǯ
adb -s %device_name% shell input tap %tap_shou_zoulu_x% %tap_shou_zoulu_y% 
ping localhost -n 1 > nul

rem echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

goto :eof

 
  




