@echo off
d:
cd D:\dev\Android\sdk\platform-tools
   
:xun_huan_hua_dong

set /a m+=1

rem echo ������ҳ 
adb shell input swipe 333 300 0 300  
  
rem echo ��ͣ10�� 
ping localhost -n 2 > nul 

if %m% leq 200 ( 
    goto :xun_huan_hua_dong
)

notepad 
  

  




