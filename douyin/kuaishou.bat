rem @echo off
d:
cd D:\dev\Android\sdk\platform-tools
 
  
:xun_huan_hua_dong

 rem echo »¬¶¯·­Ò³ 
 adb shell input swipe 555 900 555 138  
 
   
 rem echo ÔÝÍ£10Ãë 
 ping localhost -n 10 > nul 
 rem echo ---
 
rem adb shell input tap 634 614
rem ping localhost -n 31 > nul 
rem adb shell input keyevent 4

goto :xun_huan_hua_dong
 
rem echo pause
pause 
 
 








