@echo off
Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools

echo ���ֱ�� 
adb shell input tap 64 155 & ping localhost -n 1 > nul
echo -----------------------


:xun_huan_kai_shi

 
set "shou_hong_bao_num=0"

:chong_xin_hua_dong

set "hua_don_num=0"   

goto :start_____qu_hua_dong
:end_____qu_hua_dong
 

goto :start_____shou_hong_bao
:end_____shou_hong_bao

 
goto :start_____qu_bao_xiang 
:end_____qu_bao_xiang


if %shou_hong_bao_num% leq 6 ( 
	goto :chong_xin_hua_dong
)
  
set /a "xun_huan_ci_shu+=1" 

if %xun_huan_ci_shu% leq 9 ( 
	echo �ٴλ����ۿ�
	goto :xun_huan_kai_shi
)

notepad  
echo end-pause
pause 




::===ȥ�������� start=================================
:start_____qu_hua_dong

:_hua_dong_san_ci  

set /a "hua_don_num+=1" 

  echo ��������%hua_don_num%

if %hua_don_num% leq 3 (

	echo ������� ��ͣһ��
	adb shell input tap 562 335 & ping localhost -n 1 > nul 

	echo ������ҳ
	adb shell input swipe 999 900 999 138 & ping localhost -n 61 > nul 
	
	echo --------

	goto :_hua_dong_san_ci
) 
 
goto :end_____qu_hua_dong 


::===�պ������ start=================================
:start_____shou_hong_bao

if %hua_don_num% gtr 3 (

	echo ��� ���� ��ͣһ��
	adb shell input tap 562 335 & ping localhost -n 1 > nul 

	echo ������
	adb shell input tap 55 369 & ping localhost -n 3 > nul 

	echo ���º��
	adb shell input tap 333 1061  
 

	set /a "shou_hong_bao_num+=1"
	echo ����������!shou_hong_bao_num!
	echo --------------------
) 
  
goto :end_____shou_hong_bao 



::===ȥ������� start=================================
:start_____qu_bao_xiang

if !shou_hong_bao_num! gtr 6 (
	echo ȥ�㱦��
	ping localhost -n 1 > nul

	echo �˳�ֱ��
	adb shell input keyevent 4

	ping localhost -n 1 > nul

	echo ȥ׬Ǯ
	adb shell input tap 549 1831

	ping localhost -n 1 > nul

	echo �������
	adb shell input tap 922 1746

	ping localhost -n 1 > nul

	echo �رձ���
	adb shell input tap 546 1374

	ping localhost -n 1 > nul

	echo �˳�ȥ׬Ǯ
	adb shell input keyevent 4

	ping localhost -n 1 > nul

	echo ���ֱ��
	adb shell input tap 64 155 
	echo ===================================ȥ��ֱ��
) 
goto :end_____qu_bao_xiang



 
      
   
