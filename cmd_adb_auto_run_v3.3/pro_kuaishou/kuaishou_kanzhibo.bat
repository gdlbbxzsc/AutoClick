echo ���п�ֱ��:%boo_kuaishou_kanzhibo%
if %boo_kuaishou_kanzhibo% equ 0 goto :eof

echo ���ȥ׬Ǯ
adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%
ping localhost -n 2 > nul

echo ��ȥ׬Ǯ����������
call %root_path%utils\utils_huadongdingbu.bat   

echo ��������ֱ����ť
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0 

 
echo �����ֱ��
adb -s %device_name% shell input tap %kuaishou_tap_task_x% %kuaishou_tap_go_zhibo_y%
ping localhost -n 2 > nul

set "kuaishou_zhibo_times="

:xiaoshuo_xun_huan_hua_dong

set /a kuaishou_zhibo_times+=1 
echo %kuaishou_zhibo_times%
 
echo ֱ��������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0

echo ��ͣ32�� 
ping localhost -n 32 > nul 
   
if %kuaishou_zhibo_times% leq 9 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)
 
echo �Ƴ�ֱ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

echo �˳�ȥ׬Ǯ
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul  

call %root_path%utils\utils_sp_put.bat boo_kuaishou_kanzhibo 0

goto :eof

 
  




