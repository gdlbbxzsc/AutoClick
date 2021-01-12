:chongxincelianghuadongchangdu 

echo 请输滑动长度
echo 回到选择列表 0

set  /p "huadong_len=请输入:"

if "%huadong_len%"=="0" (
	goto :eof
)

call %root_path%utils\utils_huadongdingbu.bat 
 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0 
adb -s %device_name% shell input swipe 10 %huadong_len% 10 0

goto :chongxincelianghuadongchangdu

goto :eof