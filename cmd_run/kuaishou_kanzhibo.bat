rem @echo off 

adb -s %device_name% shell input tap %kuaishou_tap_go_zhuan_qian_x% %kuaishou_tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo ��ȥ׬Ǯ����������
call common_huadongdingbu.bat   

echo ��������ֱ����ť
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0  
adb -s %device_name% shell input swipe 10 %kuaishou_swipe_to_zhibo_y% 10 0 

 
echo �����ֱ��
adb -s %device_name% shell input tap %kuaishou_tap_go_zhibo_x% %kuaishou_tap_go_zhibo_y%
  
ping localhost -n 3 > nul

:xiaoshuo_xun_huan_hua_dong

set /a m+=1

echo ֱ��������ҳ 
adb -s %device_name% shell input swipe 10 477 10 0
  
echo ��ͣ32�� 
ping localhost -n 32 > nul 

if %m% leq 10 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)


 

echo �Ƴ�ֱ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

echo �˳�ȥ׬Ǯ
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul  

goto :eof

 
  




