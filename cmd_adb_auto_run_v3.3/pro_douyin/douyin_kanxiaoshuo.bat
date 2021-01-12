echo 运行看小说:%boo_douyin_kanxiaoshuo%
if %boo_douyin_kanxiaoshuo% equ 0 goto :eof

echo 点击去赚钱
adb -s %device_name% shell input tap %douyin_tap_go_zhuan_qian_x% %douyin_tap_go_zhuan_qian_y%
ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看小说按钮
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %douyin_swipe_to_kanxiaoshuo_y% 10 0 

echo 点击看小说
adb -s %device_name% shell input tap %douyin_tap_task_x% %douyin_tap_go_kanxiaoshuo_y%
ping localhost -n 7 > nul

echo 点击看小说书名
adb -s %device_name% shell input tap 333 %douyin_tap_go_kanxiaoshuo_name_y%
ping localhost -n 3 > nul


set "douyin_xiaoshuo_times="

:xiaoshuo_xun_huan_hua_dong

set /a douyin_xiaoshuo_times+=1
echo page:%douyin_xiaoshuo_times%

echo 暂停1秒 
ping localhost -n 1 > nul 

echo 小说滑动翻页  
adb -s %device_name% shell input swipe %right_10% %center_y% 0 %center_y% 

if %douyin_xiaoshuo_times% leq 200 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)
 
echo 推出小说
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

echo 退出书架
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

rem echo 退出去赚钱页面
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul 

echo 修改任务状态0
call %root_path%utils\utils_sp_put.bat boo_douyin_kanxiaoshuo 0

goto :eof

 
  




