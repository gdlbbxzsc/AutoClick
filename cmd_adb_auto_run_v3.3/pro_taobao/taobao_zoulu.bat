echo 运行走路:%boo_taobao_zoulu%
if %boo_taobao_zoulu% equ 0 goto :eof
 
rem echo 将去赚钱滑动到顶部
rem call %root_path%utils\utils_huadongdingbu.bat   

echo 滑动到看视频按钮
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0  
adb -s %device_name% shell input swipe 10 %taobao_swipe_to_zoulu_y% 10 0 
 
echo 点击走路
adb -s %device_name% shell input tap %taobao_tap_task_x% %taobao_tap_go_zoulu_y%
ping localhost -n 4 > nul


call :taobao_zl_sp30
call :taobao_zl_zb30

call :taobao_zl_zb60
call :taobao_zl_sp60

call :taobao_zl_sp5m
call :taobao_zl_sp10m

 
  
echo 点击走路go
adb -s %device_name% shell input tap %taobao_tap_shou_zoulu_x% %taobao_tap_shou_zoulu_y% 
ping localhost -n 8 > nul




echo 点击走路元宝 1
adb -s %device_name% shell input tap %taobao_tap_yuanbao_zoulu_x1% %taobao_tap_yuanbao_zoulu_y1% 
ping localhost -n 3 > nul

echo 点击走路元宝 2
adb -s %device_name% shell input tap %taobao_tap_yuanbao_zoulu_x2% %taobao_tap_yuanbao_zoulu_y2% 
ping localhost -n 3 > nul

echo 点击走路元宝 3
adb -s %device_name% shell input tap %taobao_tap_yuanbao_zoulu_x3% %taobao_tap_yuanbao_zoulu_y3% 
ping localhost -n 3 > nul

echo 点击走路元宝 4
adb -s %device_name% shell input tap %taobao_tap_yuanbao_zoulu_x4% %taobao_tap_yuanbao_zoulu_y4% 
ping localhost -n 3 > nul

echo 点击走路元宝 5
adb -s %device_name% shell input tap %taobao_tap_yuanbao_zoulu_x5% %taobao_tap_yuanbao_zoulu_y5% 
ping localhost -n 3 > nul

echo 点击走路元宝 6
adb -s %device_name% shell input tap %taobao_tap_yuanbao_zoulu_x6% %taobao_tap_yuanbao_zoulu_y6% 
ping localhost -n 3 > nul




echo 退出走路
adb -s %device_name% shell input keyevent 4
ping localhost -n 2 > nul 

call %root_path%utils\utils_sp_put.bat boo_taobao_zoulu 0

goto :eof

 
::=================== 
:tongyongdianji

echo 点击走路赠送
adb -s %device_name% shell input tap %taobao_tap_song_zoulu_x% %taobao_tap_song_zoulu_y%
ping localhost -n 1 > nul
 
echo 点击清屏
adb -s %device_name% shell input tap %height_1_8% %center_x%
ping localhost -n 1 > nul

echo 点击走路任务
adb -s %device_name% shell input tap %taobao_tap_task_zoulu_x% %taobao_tap_task_zoulu_y%
ping localhost -n 2 > nul
goto :eof


::=================== 
:zoulu_kan
  
set "times=" 

:zl_rw_xunhuan

set /a times+=1 
 
echo 暂停8秒 
ping localhost -n 7 > nul 
  
echo 视频滑动翻页 
adb -s %device_name% shell input swipe 10 477 10 0

if %times% leq %1 ( 
    goto :zl_rw_xunhuan
)

ping localhost -n 5 > nul 

adb -s %device_name% shell input keyevent 4 
ping localhost -n 1 > nul
 
goto :eof

::=================== 
:taobao_zl_zb60

call :tongyongdianji

::------------
echo 点击走路任务taobao_zl_zb60
adb -s %device_name% shell input tap %taobao_tap_task_rw_zoulu_x% %taobao_tap_task_rw_zoulu_y1%
ping localhost -n 2 > nul
 
call :zoulu_kan 9

goto :eof

::=================== 
:taobao_zl_sp30

call :tongyongdianji

::------------
echo 点击走路任务taobao_zl_sp30
adb -s %device_name% shell input tap %taobao_tap_task_rw_zoulu_x% %taobao_tap_task_rw_zoulu_y2%
ping localhost -n 2 > nul
 
call :zoulu_kan 5

goto :eof

::=================== 
:taobao_zl_sp5m

call :tongyongdianji

::------------
echo 点击走路任务taobao_zl_sp5m
adb -s %device_name% shell input tap %taobao_tap_task_rw_zoulu_x% %taobao_tap_task_rw_zoulu_y3%
ping localhost -n 2 > nul
 
call :zoulu_kan 44

goto :eof

::=================== 
:taobao_zl_sp10m

call :tongyongdianji

::------------
echo 点击走路任务taobao_zl_sp10m
adb -s %device_name% shell input tap %taobao_tap_task_rw_zoulu_x% %taobao_tap_task_rw_zoulu_y4%
ping localhost -n 2 > nul
 
call :zoulu_kan 88

goto :eof

::=================== 
:taobao_zl_sp60

call :tongyongdianji

::------------
echo 点击走路任务taobao_zl_sp60
adb -s %device_name% shell input tap %taobao_tap_task_rw_zoulu_x% %taobao_tap_task_rw_zoulu_y5%
ping localhost -n 2 > nul
 
call :zoulu_kan 9

goto :eof


::=================== 
:taobao_zl_zb30

call :tongyongdianji

::------------
echo 点击走路任务taobao_zl_zb60
adb -s %device_name% shell input tap %taobao_tap_task_rw_zoulu_x% %taobao_tap_task_rw_zoulu_y6%
ping localhost -n 2 > nul
 
call :zoulu_kan 5

goto :eof