echo ���и�������:%boo_kuaishou_fulirenwu%
if %boo_kuaishou_fulirenwu% equ 0 goto :eof

echo ���ȥ׬Ǯ
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%
ping localhost -n 6 > nul

echo ��ȥ׬Ǯ����������
call %root_path%utils\utils_huadongdingbu.bat   

echo ����������������ť
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_fulirenwu_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_fulirenwu_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_fulirenwu_y% 10 0 

   
set "kuaishou_fuli_times="

:xiaoshuo_xun_huan_hua_dong

set /a kuaishou_fuli_times+=1 
echo times:%kuaishou_fuli_times%

echo �������������
adb -s %device_name% shell input tap %kuaishou_tap_task_x% %kuaishou_tap_go_fulirenwu_y%
call %root_path%pro_kuaishou\kuaishou_kanguanggao.bat 35
   
if %kuaishou_fuli_times% leq 9 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)
 
echo �Ƴ���������
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

echo �˳�ȥ׬Ǯ
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul  

call %root_path%utils\utils_sp_put.bat boo_kuaishou_fulirenwu 0

goto :eof

 
   