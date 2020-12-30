@echo off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools
rem 循环 看视频


rem echo 开始看视频  
 
:xun_huan 

call :start_____qu_hua_dong  


call :start_____qu_bao_xiang 


call douyin_kanshipin_tuichu_paanduan.bat tuishipin_result
rem echo tuishipin_result:%tuishipin_result%


rem set tuishipin_result=1 
if %tuishipin_result% equ 1 (
	rem adb shell input keyevent 4
	notepad
	echo "可退出视频"
	rem goto :eof
) 

goto :xun_huan
 
rem echo end-pause
pause 
goto :eof
::======================================


:start_____qu_hua_dong

rem echo 暂停10秒 
ping localhost -n 10 > nul 

rem echo 滑动翻页 
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

echo 开宝箱完毕

goto :eof


 







 
      
   
