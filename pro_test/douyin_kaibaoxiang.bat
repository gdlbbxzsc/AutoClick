rem @echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools 
rem ����ҳȥ������
::============================
rem ���ȥ׬Ǯ x y
set "tap_go_zhuan_qian_x=549"
set "tap_go_zhuan_qian_y=1831"

rem ������� x y
set "tap_go_bao_xiang_x=922"
set "tap_go_bao_xiang_y=1746"
rem �رձ��� x y
set "tap_close_bao_xiang_x=546"
set "tap_close_bao_xiang_y=1374"

::============================
rem echo ȥ׬Ǯҳ��
adb shell input tap %tap_go_zhuan_qian_x% %tap_go_zhuan_qian_y%

ping localhost -n 2 > nul

adb shell input swipe %swipe_v_zhi_bo_x% %swipe_v_zhi_bo_y1% %swipe_v_zhi_bo_x% %swipe_v_zhi_bo_y2% & ping localhost -n 30 > nul  

rem echo �������
adb shell input tap %tap_go_bao_xiang_x% %tap_go_bao_xiang_y%

ping localhost -n 2 > nul

rem echo �رձ���
adb shell input tap %tap_close_bao_xiang_x% %tap_close_bao_xiang_y%

ping localhost -n 1 > nul

rem echo �˳�ȥ׬Ǯҳ��
adb shell input keyevent 4