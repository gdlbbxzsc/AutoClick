@echo off
d:
cd D:\dev\Android\sdk\platform-tools
 
:chong_xin_kai_shi
set m=

:xun_huan_hua_dong

rem echo ������ҳ 
adb shell input swipe 999 900 999 138  

set /a m+=1
rem echo ������ҳ����
rem echo %n%

rem echo ��ͣ10��
rem TIMEOUT /T 15
ping localhost -n 10 > nul 
rem echo ---

if %m% geq 120 ( 
    goto :qu_bao_xiang
)

goto :xun_huan_hua_dong
 
rem echo pause
pause 

:qu_bao_xiang

rem echo ȥ׬Ǯ
adb shell input tap 549 1831

ping localhost -n 4 > nul

rem echo �������
adb shell input tap 922 1746

ping localhost -n 3 > nul

rem echo �رձ���
adb shell input tap 546 1374

ping localhost -n 2 > nul

rem echo �˳�ȥ׬Ǯ
adb shell input keyevent 4

rem echo ----------------------

goto :chong_xin_kai_shi








