echo 运行福利任务:%boo_kuaishou_fulirenwu%
if %boo_kuaishou_fulirenwu% equ 0 goto :eof

echo 点击去赚钱
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%
ping localhost -n 6 > nul

echo 将去赚钱滑动到顶部
call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看福利任务按钮
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_fulirenwu_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_fulirenwu_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_fulirenwu_y% 10 0 

   
set "kuaishou_fuli_times="

:xiaoshuo_xun_huan_hua_dong

set /a kuaishou_fuli_times+=1 
echo times:%kuaishou_fuli_times%

echo 点击看福利任务
adb -s %device_name% shell input tap %kuaishou_tap_task_x% %kuaishou_tap_go_fulirenwu_y%
call %root_path%pro_kuaishou\kuaishou_kanguanggao.bat 35
   
if %kuaishou_fuli_times% leq 9 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)
 
echo 推出福利任务
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

echo 退出去赚钱
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul  

call %root_path%utils\utils_sp_put.bat boo_kuaishou_fulirenwu 0

goto :eof

 
   