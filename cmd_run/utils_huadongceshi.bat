rem @echo off 
 
:chongxincelianghuadongchangdu 

echo 请输入预计滑动长度的三分之一运行程序 
echo 退出 0

set  /p "huadong_len=请输入预计滑动长度的三分之一："

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