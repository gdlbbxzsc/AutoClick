rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem ����ҳȥ�����
::============================
rem ���ȥ׬Ǯ x y
set "tap_go_zhuan_qian_x=549"
set "tap_go_zhuan_qian_y=1831"

rem ��������水ť x y
set "swipe_to_guanggao_x=333"
set "swipe_to_guanggao_y1=1000" 
set "swipe_to_guanggao_y2=0" 

rem ������ x y
set "tap_go_guang_gao_x=891"
set "tap_go_guang_gao_y=1427"

 
::============================
rem echo ȥ׬Ǯҳ��
adb shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

��ȥ׬Ǯ����������
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  
adb shell input swipe 333 50 333 500  

rem echo ��������水ť
adb shell input swipe %swipe_to_guanggao_x% %swipe_to_guanggao_y1% %swipe_to_guanggao_x% %swipe_to_guanggao_y2% 

 
rem echo ������
adb shell input tap %tap_go_guang_gao_x% %tap_go_guang_gao_y%
 

rem echo �˳�ȥ׬Ǯҳ��
adb shell input keyevent 4