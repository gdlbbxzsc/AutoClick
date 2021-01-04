rem @echo off 
  
:retry 

echo ��ѡ�������
echo ѡ�񻬶�������Թ��� ������1
echo ѡ��鿴�豸�б� ������2
echo ѡ�����ж������� ������3
echo ѡ�����п��ֳ��� ������4

echo �˳� 0

set /p c=���������Ĳ����� 

if "%c%"=="0" (
	goto :eof
)
if "%c%"=="1" (
	call utils_huadongceshi.bat
	goto retry
)

if "%c%"=="2" (
	echo========================
	adb devices
	echo========================
	goto retry

)
if "%c%"=="3" (
	call :run_douyin
)

if "%c%"=="4" (
	call :run_kuaishou
)

goto retry 
  
::==================================
:run_douyin   
echo �����豸��Ϣ
call "douyin_device_%device_name%.bat"

::----------------------
rem call test_set.bat

::----------------------
rem set "douyin_last_qu_kan_guang_gao_time=0"
rem set "douyin_last_kai_bao_xiang_time=0"
::----------------------


echo ���п�С˵:%boo_douyin_kanxiaoshuo%
if %boo_douyin_kanxiaoshuo% equ 1 call douyin_kanxiaoshuo.bat
 

echo ������·:%boo_douyin_zoulu%
if %boo_douyin_zoulu% equ 1 call douyin_zoulu.bat
 
 
echo ���п�ֱ��:%boo_douyin_kanzhibo%
if %boo_douyin_kanzhibo% equ 1 call douyin_kanzhibo.bat


echo ���п���Ƶ:%boo_douyin_kanshipin%
if %boo_douyin_kanshipin% equ 1 call douyin_kanshipin.bat

goto :eof


::==================================
:run_kuaishou   
echo �����豸��Ϣ
call "kuaishou_device_%device_name%.bat"

::----------------------
rem call test_set.bat

::---------------------- 
rem set "kuaishou_last_kai_bao_xiang_time=0"
::----------------------
 
 
 
echo ���п�ֱ��:%boo_kuaishou_kanzhibo%
if %boo_kuaishou_kanzhibo% equ 1 call kuaishou_kanzhibo.bat


echo ���п���Ƶ:%boo_kuaishou_kanshipin%
if %boo_kuaishou_kanshipin% equ 1 call kuaishou_kanshipin.bat

goto :eof

