rem adb -s 954c408 shell dumpsys window displays  
rem adb -s 954c408 shell wm density  

for /F "tokens=3" %%i in ('adb -s %device_name% shell wm size') do (
	set wm_size=%%i
)
echo 分辨率:%wm_size%
  
for /f "tokens=1,2 delims=x" %%a in ("%wm_size%") do (

	set "wm_width=%%a"
	set "wm_height=%%b" 
)
echo wm_width:%wm_width%
echo wm_height:%wm_height%
 
rem 配置分辨率信息
call %root_path%base_config\config_screen.bat