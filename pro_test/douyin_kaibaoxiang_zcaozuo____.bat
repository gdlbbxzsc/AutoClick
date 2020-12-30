@echo off 
rem 判断是否可以开宝箱 条件 从打开程序开始每隔二十分钟打开一次宝箱

call douyin_kaibaoxiang_panduan.bat kaibaoxiang_result
rem echo kaibaoxiang_result:%kaibaoxiang_result%


rem set kaibaoxiang_result=1 
if %kaibaoxiang_result% equ 1 (
	call :go_kai_bao_xiang
	goto :eof
) 

rem pause
goto :eof
::====================================
:go_kai_bao_xiang
--------
rem: 退到首页
--------
call douyin_kaibaoxiang.bat  
echo 开宝箱完毕
goto :eof