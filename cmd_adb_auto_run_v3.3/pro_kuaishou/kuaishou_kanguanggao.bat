echo 看广告时间%1 
 
ping localhost -n %1 > nul
 
adb -s %device_name% shell input keyevent 4
 
ping localhost -n 3 > nul
echo 推出广告