rem @echo off 

adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部
call common_huadongdingbu.bat   

rem echo 滑动到看小说按钮
adb -s %device_name% shell input swipe 10 %swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_kanxiaoshuo_y% 10 0 


echo 点击看小说
adb -s %device_name% shell input tap %tap_go_kanxiaoshuo_x% %tap_go_kanxiaoshuo_y%
  
ping localhost -n 5 > nul

echo 点击看小说书名
adb -s %device_name% shell input tap 333 %tap_go_kanxiaoshuo_name_y%
  
ping localhost -n 5 > nul

 

:xiaoshuo_xun_huan_hua_dong

set /a m+=1

echo 小说滑动翻页 
rem adb -s %device_name% shell input tap %tap_to_swipe_xiaoshuo_x% %tap_to_swipe_xiaoshuo_y%
adb -s %device_name% shell input swipe %tap_to_swipe_xiaoshuo_x% %tap_to_swipe_xiaoshuo_y% 0 %tap_to_swipe_xiaoshuo_y% 

  
echo 暂停2秒 
ping localhost -n 2 > nul 

if %m% leq 200 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)


 

rem echo 推出小说
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 
rem echo 退出书架
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 
rem echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

goto :eof

 
  




