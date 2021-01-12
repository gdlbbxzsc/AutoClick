echo 运行看直播:%boo_kuaishou_kanzhibo%
if %boo_kuaishou_kanzhibo% equ 0 goto :eof

echo 点击去赚钱
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%
ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看直播按钮
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0 

 
echo 点击看直播
adb -s %device_name% shell input tap %kuaishou_tap_task_x% %kuaishou_tap_go_zhibo_y%
ping localhost -n 2 > nul

set "kuaishou_zhibo_times="

:xiaoshuo_xun_huan_hua_dong

set /a kuaishou_zhibo_times+=1 
echo %kuaishou_zhibo_times%
 
echo 直播滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0

echo 暂停32秒 
ping localhost -n 32 > nul 
   
if %kuaishou_zhibo_times% leq 9 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)
 
echo 推出直播
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

echo 退出去赚钱
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul  

call %root_path%utils\utils_sp_put.bat boo_kuaishou_kanzhibo 0

goto :eof

 
  




