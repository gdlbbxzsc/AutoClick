@echo off
d:
cd D:\dev\Android\sdk\platform-tools
   
:xun_huan_hua_dong

set /a m+=1

rem echo »¬¶¯·­Ò³ 
adb shell input swipe 900 900 50 900  
  
rem echo ÔÝÍ£10Ãë 
ping localhost -n 2 > nul 

if %m% leq 200 ( 
    goto :xun_huan_hua_dong
)

notepad 
  

  