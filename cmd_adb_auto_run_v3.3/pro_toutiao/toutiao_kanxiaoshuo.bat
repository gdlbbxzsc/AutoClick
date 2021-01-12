echo 运行看小说:%boo_toutiao_kanxiaoshuo%
if %boo_toutiao_kanxiaoshuo% equ 0 goto :eof


echo 点击去赚钱
adb -s %device_name% shell input tap %toutiao_tap_go_zhuan_qian_x% %toutiao_tap_go_zhuan_qian_y%
ping localhost -n 2 > nul

echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat   

rem echo 滑动到看小说按钮
adb -s %device_name% shell input swipe 10 %toutiao_swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %toutiao_swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %toutiao_swipe_to_kanxiaoshuo_y% 10 0 


echo 点击看小说
adb -s %device_name% shell input tap %toutiao_tap_task_x% %toutiao_tap_go_kanxiaoshuo_y%
ping localhost -n 5 > nul

set "toutiao_xiaoshuo_chongkai_times="

:xiaoshuo_xun_huan_chongkai

set /a toutiao_xiaoshuo_chongkai_times+=1

echo 点击看小说书名
adb -s %device_name% shell input tap 333 %toutiao_tap_go_kanxiaoshuo_name_y% 
ping localhost -n 5 > nul

set "toutiao_xiaoshuo_times="

:xiaoshuo_xun_huan_hua_dong

set /a toutiao_xiaoshuo_times+=1
echo page:%toutiao_xiaoshuo_times%

echo 小说滑动翻页  
adb -s %device_name% shell input swipe %right_10% %center_y% 0 %center_y% 

echo 暂停2秒 
ping localhost -n 1 > nul 

if %toutiao_xiaoshuo_times% leq 20 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)

echo 推出小说
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul   

if %toutiao_xiaoshuo_chongkai_times% leq 30 ( 
    goto :xiaoshuo_xun_huan_chongkai
)

call %root_path%utils\utils_sp_put.bat boo_toutiao_kanxiaoshuo 0
  
goto :eof

 
  




