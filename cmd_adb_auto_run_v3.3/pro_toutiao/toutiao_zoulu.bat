echo 运行走路:%boo_toutiao_zoulu%
if %boo_toutiao_zoulu% equ 0 goto :eof 

echo 点击去赚钱
adb -s %device_name% shell input tap %toutiao_tap_go_zhuan_qian_x% %toutiao_tap_go_zhuan_qian_y%
ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部 
call %root_path%utils\utils_huadongdingbu.bat  
  
  
echo 点击走路
adb -s %device_name% shell input tap %toutiao_tap_go_zoulu_x% %toutiao_tap_go_zoulu_y%
ping localhost -n 6 > nul

echo 点击走路收钱
adb -s %device_name% shell input tap %toutiao_tap_shou_zoulu_x% %toutiao_tap_shou_zoulu_y% 
ping localhost -n 1 > nul

echo 退出走路
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

call %root_path%utils\utils_sp_put.bat boo_toutiao_zoulu 0

goto :eof

 
  




