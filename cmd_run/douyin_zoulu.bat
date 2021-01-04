rem @echo off 

adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部 
call common_huadongdingbu.bat  
  


rem echo 滑动到走路按钮
adb -s %device_name% shell input swipe 10 %swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_zoulu_y% 10 0 


 
rem echo 点击走路
adb -s %device_name% shell input tap %tap_go_zoulu_x% %tap_go_zoulu_y%
  
ping localhost -n 3 > nul

rem echo 点击走路收钱
adb -s %device_name% shell input tap %tap_shou_zoulu_x% %tap_shou_zoulu_y% 
ping localhost -n 1 > nul

rem echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

goto :eof

 
  




