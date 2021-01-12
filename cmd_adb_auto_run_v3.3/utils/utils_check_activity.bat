set "may_run_activity=%1"

echo 检查界面运转是否正常%may_run_activity%

for /F "tokens=2* delims={}" %%i in ('adb -s %device_name% shell dumpsys activity ^| findstr "mFocusedActivity"') do (
	set current_activity=%%i
)


echo current_activity=>%current_activity% 
echo may_run_activity=>%may_run_activity% 


echo %current_activity% | findstr %may_run_activity% >nul && set "check_activity_result=1" || set "check_activity_result=0"

 
if %check_activity_result% equ 0 (
	echo "%device_name%界面异常:now:%current_activity%    may:%may_run_activity%" >%log_path%
	start %log_path%
)

goto :eof
 