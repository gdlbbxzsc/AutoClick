rem @echo off 

::=================================
rem 读取全局配置信息
call alltask_devices.bat

echo 调用抖音设备信息
call "douyin_device_%device_name%.bat"


echo 调用快手设备信息
call "kuaishou_device_%device_name%.bat"


echo 调用淘宝设备信息
call "taobao_device_%device_name%.bat"

::=================================


title %device_name%

::=================================


rem 如果 广告宝箱时间不对 可以在这里设置一下
::----------------------
set "douyin_last_qu_kan_guang_gao_time=0"
set "douyin_last_kai_bao_xiang_time=0"
::---------------------- 
set "kuaishou_last_kai_bao_xiang_time=0"
::---------------------- 
set "taobao_last_kai_bao_xiang_time=0"
::----------------------
::=================================


:retry 

echo 请选择操作：
echo 选择滑动距离测试功能 请输入1
echo 选择查看设备列表 请输入2
echo 选择运行抖音程序 请输入3
echo 选择运行快手程序 请输入4
echo 选择运行淘宝程序 请输入5

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

if "%c%"=="5" (
	call :run_taobao
)

notepad

goto retry 
  
::==================================
:run_douyin   

::----------------------
rem call test_set.bat


echo 运行看小说:%boo_douyin_kanxiaoshuo%
if %boo_douyin_kanxiaoshuo% equ 1 call douyin_kanxiaoshuo.bat
 

echo 运行走路:%boo_douyin_zoulu%
if %boo_douyin_zoulu% equ 1 call douyin_zoulu.bat
 
 
echo 运行看直播:%boo_douyin_kanzhibo%
if %boo_douyin_kanzhibo% equ 1 call douyin_kanzhibo.bat


echo 运行看视频:%boo_douyin_kanshipin%
if %boo_douyin_kanshipin% equ 1 call douyin_kanshipin.bat

goto :eof


::==================================
:run_kuaishou   

::----------------------
rem call test_set.bat


echo 运行看直播:%boo_kuaishou_kanzhibo%
if %boo_kuaishou_kanzhibo% equ 1 call kuaishou_kanzhibo.bat


echo 运行看视频:%boo_kuaishou_kanshipin%
if %boo_kuaishou_kanshipin% equ 1 call kuaishou_kanshipin.bat

goto :eof


::==================================
:run_taobao

::----------------------
rem call test_set.bat


echo 运行看直播:%boo_taobao_kanzhibo%
if %boo_taobao_kanzhibo% equ 1 call taobao_kanzhibo.bat


echo 运行看视频:%boo_taobao_kanshipin%
if %boo_taobao_kanshipin% equ 1 call taobao_kanshipin.bat

goto :eof

