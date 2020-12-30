@echo off
Setlocal enabledelayedexpansion
d:
cd D:\dev\Android\sdk\platform-tools

echo 点击直播 
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
	echo 再次滑动观看
	goto :xun_huan_kai_shi
)

notepad  
echo end-pause
pause 




::===去滑动操作 start=================================
:start_____qu_hua_dong

:_hua_dong_san_ci  

set /a "hua_don_num+=1" 

  echo 滑动次数%hua_don_num%

if %hua_don_num% leq 3 (

	echo 点击清屏 暂停一秒
	adb shell input tap 562 335 & ping localhost -n 1 > nul 

	echo 滑动翻页
	adb shell input swipe 999 900 999 138 & ping localhost -n 61 > nul 
	
	echo --------

	goto :_hua_dong_san_ci
) 
 
goto :end_____qu_hua_dong 


::===收红包操作 start=================================
:start_____shou_hong_bao

if %hua_don_num% gtr 3 (

	echo 点击 清屏 暂停一秒
	adb shell input tap 562 335 & ping localhost -n 1 > nul 

	echo 点击红包
	adb shell input tap 55 369 & ping localhost -n 3 > nul 

	echo 收下红包
	adb shell input tap 333 1061  
 

	set /a "shou_hong_bao_num+=1"
	echo 点击红包次数!shou_hong_bao_num!
	echo --------------------
) 
  
goto :end_____shou_hong_bao 



::===去宝箱操作 start=================================
:start_____qu_bao_xiang

if !shou_hong_bao_num! gtr 6 (
	echo 去点宝箱
	ping localhost -n 1 > nul

	echo 退出直播
	adb shell input keyevent 4

	ping localhost -n 1 > nul

	echo 去赚钱
	adb shell input tap 549 1831

	ping localhost -n 1 > nul

	echo 点击宝箱
	adb shell input tap 922 1746

	ping localhost -n 1 > nul

	echo 关闭宝箱
	adb shell input tap 546 1374

	ping localhost -n 1 > nul

	echo 退出去赚钱
	adb shell input keyevent 4

	ping localhost -n 1 > nul

	echo 点击直播
	adb shell input tap 64 155 
	echo ===================================去看直播
) 
goto :end_____qu_bao_xiang



 
      
   
