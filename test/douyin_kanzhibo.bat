@echo off
d:
cd D:\dev\Android\sdk\platform-tools

rem echo ���ֱ��
adb shell input tap 64 155
ping localhost -n 2 > nul

:yun_xing_ci_shu

set n=  

:hua_dong_ji_shu

goto :start_____qu_hua_dong_san_ci
:end_____qu_hua_dong_san_ci


goto :start_____shou_hong_bao
:end_____shou_hong_bao


if %m% equ 7 ( 
    rem echo ȥ�㱦��
    goto :start_____qu_bao_xiang
)
:end_____qu_bao_xiang


if %m% leq 10 ( 
    rem echo �ٴλ����ۿ�
    goto :yun_xing_ci_shu
)

echo pause
pause 




rem ===ȥ�������� start=================================
:start_____qu_hua_dong_san_ci

set /a n+=1 
rem echo ��������
rem echo %n%
rem echo ----

if %n% leq 3 (

    rem echo ��� ���� ��ͣһ��
    adb shell input tap 562 335
    ping localhost -n 1 > nul 

    rem echo ������ҳ
    adb shell input swipe 999 900 999 138

    rem echo ��ͣ 
    ping localhost -n 61 > nul  
    rem echo --------

    goto :hua_dong_ji_shu
) 
 
goto :end_____qu_hua_dong_san_ci
rem ===ȥ�������� end=================================


rem ===�պ������ start=================================
:start_____shou_hong_bao

if %n% gtr 3 (

    rem echo ��� ���� ��ͣһ��
    adb shell input tap 562 335  
    ping localhost -n 1 > nul 
    
    rem echo ���
    adb shell input tap 55 369 
    rem echo ���
    
    ping localhost -n 3 > nul 
    
    rem echo ����
    adb shell input tap 333 1061  
    
    set /a m+=1 
    rem echo �������
    rem echo %m%
    rem echo --------------------
 
) 
  
goto :end_____shou_hong_bao
rem ===�պ������ end=================================



rem ===ȥ������� start=================================
:start_____qu_bao_xiang

ping localhost -n 2 > nul

rem echo �˳�ֱ��
adb shell input keyevent 4

ping localhost -n 4 > nul

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

ping localhost -n 2 > nul

rem echo ���ֱ��
adb shell input tap 64 155

goto :end_____qu_bao_xiang
rem ===ȥ������� end=================================