rem @echo off 
 
:chongxincelianghuadongchangdu 

echo ������Ԥ�ƻ������ȵ�����֮һ���г��� 
echo �˳� 0

set  /p "huadong_len=������Ԥ�ƻ������ȵ�����֮һ��"

if "%huadong_len%"=="0" (
	goto :eof
)

adb -s %device_name% shell input swipe 10 130 10 800 
adb -s %device_name% shell input swipe 10 130 10 800 
adb -s %device_name% shell input swipe 10 130 10 800 
adb -s %device_name% shell input swipe 10 130 10 800 
adb -s %device_name% shell input swipe 10 130 10 800 
adb -s %device_name% shell input swipe 10 130 10 800 
 

adb -s %device_name% shell input swipe 10 %huadong_len% 10 0 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0

goto :chongxincelianghuadongchangdu