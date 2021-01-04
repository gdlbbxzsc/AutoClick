rem @echo off 

adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部
call common_huadongdingbu.bat   

rem echo 滑动到看直播按钮
adb -s %device_name% shell input swipe 10 %swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_zhibo_y% 10 0 

 
rem echo 点击看直播
adb -s %device_name% shell input tap %tap_go_zhibo_x% %tap_go_zhibo_y%
  
ping localhost -n 3 > nul

:xiaoshuo_xun_huan_hua_dong

set /a m+=1

echo 直播滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0
  
echo 暂停32秒 
ping localhost -n 32 > nul 

if %m% leq 10 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)


 

rem echo 推出直播
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

rem echo 退出去赚钱
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul  

goto :eof

 
  




