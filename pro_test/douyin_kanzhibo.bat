@echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools
rem ѭ�� ��ֱ��


rem echo ��ʼ��ֱ��  
 
:xun_huan 

  

call :start_____qu_hua_dong  

call :start_____shou_hong_bao 

call :start_____qu_bao_xiang 


call douyin_kanzhibo_tuichu_paanduan.bat tuizhibo_result
rem echo tuizhibo_result:%tuizhibo_result%


rem set tuizhibo_result=1 
if %tuizhibo_result% equ 1 (
	adb shell input keyevent 4
	notepad
	echo "���˳�ֱ��"
	goto :eof
) 

goto :xun_huan
 
rem echo end-pause
pause 
goto :eof
::======================================


:start_____qu_hua_dong

echo ������� ��ͣһ��
adb shell input tap 562 335 & ping localhost -n 1 > nul 

echo ������ҳ
adb shell input swipe 999 900 999 138 & ping localhost -n 30 > nul  
echo -------- 
goto :eof

 
::--------------------------------------
:start_____shou_hong_bao

call douyin_kanzhibo_hongbao_paanduan.bat kanzhibo_hongbao_result
rem echo kanzhibo_hongbao_result:%kanzhibo_hongbao_result%


rem set kanzhibo_hongbao_result=1 
if %kanzhibo_hongbao_result% equ 1 (
	call :go_kai_zhibo_hongbao
	goto :eof
) 
 
goto :eof
::--------------------------------------
:go_kai_zhibo_hongbao

echo ��� ���� ��ͣһ��
adb shell input tap 562 335 & ping localhost -n 1 > nul 

echo ������
adb shell input tap 55 369 & ping localhost -n 3 > nul 

echo ���º��
adb shell input tap 333 1061  

echo ��ֱ��������
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

echo �˳�ֱ��ȥ������
adb shell input keyevent 4 & ping localhost -n 1 > nul

call douyin_kaibaoxiang.bat  

echo ���������

goto :eof


 







 
      
   
