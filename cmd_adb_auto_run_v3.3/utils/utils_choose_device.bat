set "row_num=0"
for /F "skip=1 tokens=1" %%i in ('adb devices') do (
	set /a "row_num+=1" 
	echo �к�:!row_num!    device_name:%%i
) 

echo �������к�ѡ���豸
echo ˢ�� 0 

set /p choose_row_num=�����룺
 
if "%choose_row_num%"=="0" (
	set "device_name="
	goto :eof
)
 
set "row_num=0"
for /F "skip=1 tokens=1" %%i in ('adb devices') do (
	set /a "row_num+=1"  
	if !row_num! equ !choose_row_num! set "device_name=%%i" 
)  
echo ��ѡ��device_name:%device_name%