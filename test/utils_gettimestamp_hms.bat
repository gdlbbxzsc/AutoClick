rem @echo off 

set time_h=%time:~0,2%

set time_m=%time:~3,2%

set time_s=%time:~6,2%

if "%time_h:~,1%"=="0"  (
	set time_h=%time_h:~1%
)

if "%time_m:~,1%"=="0"  (
	set time_m=%time_m:~1%
)

if "%time_s:~,1%"=="0"  (
	set time_s=%time_s:~1%
)

echo %time_h%
echo %time_m%
echo %time_s%

set /a result=%time_h%*3600 + %time_m%*60 + %time_s%

echo %result%

rem set /a %1 = %result%+1

pause
  
