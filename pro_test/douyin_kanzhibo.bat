@echo  off
rem Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools
rem ѭ�� ��ֱ��

::======================================
rem ���ȥ��ֱ�� x y
set "tap_go_zhi_bo_x=64"
set "tap_go_zhi_bo_y=155"

rem ������� x y ���������ã������ǵ��һ�����Կհ״�û�а�ťû�е���û�л�����Ϣ��λ��
set "tap_zhi_bo_clear_x=562"
set "tap_zhi_bo_clear_y=335"


rem ֱ����� x y
set "tap_zhi_bo_hongbao_x=55"
set "tap_zhi_bo_hongbao_y=369"

rem ֱ�����shouxia x y
set "tap_zhi_bo_hongbao_get_x=333"
set "tap_zhi_bo_hongbao_get_y=1061"
::======================================
 
echo ���ȥ��ֱ��
adb shell input tap %tap_go_zhi_bo_x% &tap_go_zhi_bo_y& & ping localhost -n 1 > nul

echo ��ʼ��ֱ��  
 
:xun_huan 

  

call :start_____qu_hua_dong  

call :start_____shou_hong_bao 

call :start_____qu_bao_xiang 


call douyin_kanzhibo_tuichu_paanduan.bat tuizhibo_result
echo tuizhibo_result:%tuizhibo_result%


rem set tuizhibo_result=1 
if %tuizhibo_result% equ 1 (
	adb shell input keyevent 4
	notepad
	echo "���˳�ֱ��"
	goto :eof
) 

goto :xun_huan
 
echo end-pause
pause 
goto :eof
::======================================


:start_____qu_hua_dong

echo ������� ��ͣһ��
adb shell input tap %tap_zhi_bo_clear_x% %tap_zhi_bo_clear_y% & ping localhost -n 1 > nul 

echo ������ҳ
adb shell input swipe 333 477 333 0 & ping localhost -n 30 > nul  
echo 
goto :eof

 

:start_____shou_hong_bao

call douyin_kanzhibo_hongbao_paanduan.bat kanzhibo_hongbao_result
echo kanzhibo_hongbao_result:%kanzhibo_hongbao_result%


rem testset kanzhibo_hongbao_result=1 
if %kanzhibo_hongbao_result% equ 1 (
	call :go_kai_zhibo_hongbao
	goto :eof
) 
 
goto :eof




:go_kai_zhibo_hongbao

echo ��� ���� ��ͣһ��
adb shell input tap %tap_zhi_bo_clear_x% %tap_zhi_bo_clear_y% & ping localhost -n 1 > nul  

echo ������
adb shell input tap %tap_zhi_bo_hongbao_x% %tap_zhi_bo_hongbao_y% & ping localhost -n 3 > nul 

echo ���º��
adb shell input tap %tap_zhi_bo_hongbao_get_x% %tap_zhi_bo_hongbao_get_y%

echo ��ֱ��������
goto :eof




:start_____qu_bao_xiang
call douyin_kaibaoxiang_panduan.bat kaibaoxiang_result
echo kaibaoxiang_result:%kaibaoxiang_result%


rem testset kaibaoxiang_result=1 
if %kaibaoxiang_result% equ 1 (
	call :go_kai_bao_xiang
	goto :eof
) 
 
goto :eof




:go_kai_bao_xiang

echo �˳�ֱ��ȥ������
adb shell input keyevent 4 & ping localhost -n 1 > nul

call douyin_kaibaoxiang.bat  

echo ���������

goto :eof
