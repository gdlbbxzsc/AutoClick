@echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools
rem ѭ�� ����Ƶ


rem echo ��ʼ����Ƶ  
 
:xun_huan 

call :start_____qu_hua_dong  


call :start_____qu_bao_xiang 


call douyin_kanshipin_tuichu_paanduan.bat tuishipin_result
rem echo tuishipin_result:%tuishipin_result%


rem set tuishipin_result=1 
if %tuishipin_result% equ 1 (
	rem adb shell input keyevent 4
	notepad
	echo "���˳���Ƶ"
	rem goto :eof
) 

goto :xun_huan
 
rem echo end-pause
pause 
goto :eof
::======================================


:start_____qu_hua_dong

rem echo ��ͣ10�� 
ping localhost -n 10 > nul 

rem echo ������ҳ 
adb shell input swipe 999 900 999 138

goto :eof

 
 
::--------------------------------------
:start_____qu_bao_xiang
call douyin_kaibaoxiang_panduan.bat kaibaoxiang_result
rem echo kaibaoxiang_result:%kaibaoxiang_result%


rem set kaibaoxiang_result=1 
if %kaibaoxiang_result% equ 1 (
	call :go_kai_bao_xiang
	goto :eof
) 
 
goto :eof
::--------------------------------------
:go_kai_bao_xiang
  
call douyin_kaibaoxiang.bat  

echo ���������

goto :eof


 







 
      
   
