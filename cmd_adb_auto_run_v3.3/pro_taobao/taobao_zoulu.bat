echo 运行走路:%boo_taobao_zoulu%
if %boo_taobao_zoulu% equ 0 goto :eof
 
echo 将去赚钱滑动到顶部 
call %root_path%utils\utils_huadongdingbu.bat  
  
echo 滑动到走路按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0 
 
echo 点击走路
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_zoulu_y%
ping localhost -n 4 > nul
 
echo 点击走路赠送
adb -s %device_name% shell input tap %taobao_tap_song_zoulu_x% %taobao_tap_song_zoulu_y%
ping localhost -n 1 > nul


echo 点击走路收钱
adb -s %device_name% shell input tap %taobao_tap_shou_zoulu_x% %taobao_tap_shou_zoulu_y% 
ping localhost -n 1 > nul

echo 退出走路
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul 

call %root_path%utils\utils_sp_put.bat boo_taobao_zoulu 0

goto :eof

 
  




