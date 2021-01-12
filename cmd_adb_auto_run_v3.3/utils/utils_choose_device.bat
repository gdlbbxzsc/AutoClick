set "row_num=0"
for /F "skip=1 tokens=1" %%i in ('adb devices') do (
	set /a "row_num+=1" 
	echo 行号:!row_num!    device_name:%%i
) 

echo 请输入行号选择设备
echo 刷新 0 

set /p choose_row_num=请输入：
 
if "%choose_row_num%"=="0" (
	set "device_name="
	goto :eof
)
 
set "row_num=0"
for /F "skip=1 tokens=1" %%i in ('adb devices') do (
	set /a "row_num+=1"  
	if !row_num! equ !choose_row_num! set "device_name=%%i" 
)  
echo 已选择device_name:%device_name%