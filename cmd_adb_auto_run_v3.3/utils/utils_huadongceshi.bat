:chongxincelianghuadongchangdu 

echo ���们������
echo �ص�ѡ���б� 0

set  /p "huadong_len=������:"

if "%huadong_len%"=="0" (
	goto :eof
)

call %root_path%utils\utils_huadongdingbu.bat 
 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0

goto :chongxincelianghuadongchangdu

goto :eof