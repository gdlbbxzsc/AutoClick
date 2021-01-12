adb -s %device_name% shell input keyevent 4
adb -s %device_name% shell input keyevent 4
adb -s %device_name% shell input keyevent 4
adb -s %device_name% shell input keyevent 4
adb -s %device_name% shell input keyevent 4
adb -s %device_name% shell input keyevent 4
echo 退出程序

echo 点击home键到桌面
adb -s %device_name% shell  input keyevent 3
ping localhost -n 1 > nul