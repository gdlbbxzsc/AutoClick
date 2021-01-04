rem @echo off 
  
:retry 

echo 请选择操作：
echo 选择滑动距离测试功能 请输入1
echo 选择查看设备列表 请输入2
echo 选择运行抖音程序 请输入3
echo 选择运行快手程序 请输入4

echo 退出 0

set /p c=请输入您的操作： 

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
echo 调用设备信息
call "douyin_device_%device_name%.bat"

::----------------------
rem call test_set.bat

::----------------------
 set "last_qu_kan_guang_gao_time=0"
rem set "last_kai_bao_xiang_time=0"
::----------------------


echo 运行看小说:%boo_kanxiaoshuo%
if %boo_kanxiaoshuo% equ 1 call douyin_kanxiaoshuo.bat
 

echo 运行走路:%boo_zoulu%
if %boo_zoulu% equ 1 call douyin_zoulu.bat
 
 
echo 运行看直播:%boo_kanzhibo%
if %boo_kanzhibo% equ 1 call douyin_kanzhibo.bat


echo 运行看视频:%boo_kanshipin%
if %boo_kanshipin% equ 1 call douyin_kanshipin.bat

goto :eof


::==================================
:run_kuaishou   
echo 调用设备信息
call "kuaishou_device_%device_name%.bat"

::----------------------
rem call test_set.bat

::---------------------- 
rem set "last_kai_bao_xiang_time=0"
::----------------------
 
 
 
echo 运行看直播:%boo_kanzhibo%
if %boo_kanzhibo% equ 1 call kuaishou_kanzhibo.bat


echo 运行看视频:%boo_kanshipin%
if %boo_kanshipin% equ 1 call kuaishou_kanshipin.bat

goto :eof

