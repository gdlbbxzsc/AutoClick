@echo off 
rem �ж��Ƿ���Կ����� ���� �Ӵ򿪳���ʼÿ����ʮ���Ӵ�һ�α���

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
rem: �˵���ҳ
--------
call douyin_kaibaoxiang.bat  
echo ���������
goto :eof