rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem ����ҳȥ������


rem echo ȥ׬Ǯҳ��
adb shell input tap 549 1831

ping localhost -n 2 > nul

rem echo �������
adb shell input tap 922 1746

ping localhost -n 2 > nul

rem echo �رձ���
adb shell input tap 546 1374

ping localhost -n 1 > nul

rem echo �˳�ȥ׬Ǯҳ��
adb shell input keyevent 4