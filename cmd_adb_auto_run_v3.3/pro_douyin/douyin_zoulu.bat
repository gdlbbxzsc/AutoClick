echo 运行走路:%boo_douyin_zoulu%
if %boo_douyin_zoulu% equ 0 goto :eof

echo 点击去赚钱
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 6 > nul

echo 将去赚钱滑动到顶部 
call %root_path%utils\utils_huadongdingbu.bat  
  
echo 滑动到走路按钮
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_zoulu_y% 10 0 

echo 点击走路
adb -s %device_name% shell input tap %douyin_tap_task_x% %douyin_tap_go_zoulu_y%
ping localhost -n 5 > nul

echo 点击走路收钱
adb -s %device_name% shell input tap %center_x% %douyin_tap_shou_zoulu_y% 
ping localhost -n 1 > nul

echo 退出走路
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul 

echo 修改任务状态0
call %root_path%utils\utils_sp_put.bat boo_douyin_zoulu 0

goto :eof

 
  




