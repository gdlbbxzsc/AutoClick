rem @echo off 

adb -s %device_name% shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

echo ��ȥ׬Ǯ����������
call common_huadongdingbu.bat   

rem echo ��������С˵��ť
adb -s %device_name% shell input swipe 10 %swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_kanxiaoshuo_y% 10 0  
adb -s %device_name% shell input swipe 10 %swipe_to_kanxiaoshuo_y% 10 0 


echo �����С˵
adb -s %device_name% shell input tap %tap_go_kanxiaoshuo_x% %tap_go_kanxiaoshuo_y%
  
ping localhost -n 5 > nul

echo �����С˵����
adb -s %device_name% shell input tap 333 %tap_go_kanxiaoshuo_name_y%
  
ping localhost -n 5 > nul

 

:xiaoshuo_xun_huan_hua_dong

set /a m+=1

echo С˵������ҳ 
rem adb -s %device_name% shell input tap %tap_to_swipe_xiaoshuo_x% %tap_to_swipe_xiaoshuo_y%
adb -s %device_name% shell input swipe %tap_to_swipe_xiaoshuo_x% %tap_to_swipe_xiaoshuo_y% 0 %tap_to_swipe_xiaoshuo_y% 

  
echo ��ͣ2�� 
ping localhost -n 2 > nul 

if %m% leq 200 ( 
    goto :xiaoshuo_xun_huan_hua_dong
)


 

rem echo �Ƴ�С˵
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 
rem echo �˳����
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 
rem echo �˳�ȥ׬Ǯҳ��
adb -s %device_name% shell input keyevent 4
ping localhost -n 1 > nul 

goto :eof

 
  




