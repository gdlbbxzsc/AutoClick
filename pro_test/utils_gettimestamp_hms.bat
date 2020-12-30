rem @echo off 
rem 获取从凌晨至当前时间的秒指数

set "time_h=%time:~0,2%"
set "time_m=%time:~3,2%"
set "time_s=%time:~6,2%"

rem echo time_h1:%time_h%
rem echo time_m1:%time_m%
rem echo time_s1:%time_s%

if "%time_h:~,1%"=="0" set "time_h=%time_h:~1%"
if "%time_m:~,1%"=="0" set "time_m=%time_m:~1%"
if "%time_s:~,1%"=="0" set "time_s=%time_s:~1%"
 
rem echo time_h2:%time_h%
rem echo time_m2:%time_m%
rem echo time_s2:%time_s%

set /a "result=%time_h%*3600 + %time_m%*60 + %time_s%"

rem echo utils_gettimestamp_hms:%result%

set /a "%1 = %result%+1"

rem pause
  
 