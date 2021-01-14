echo 运行全程序检查任务:%boo_alltask_run%
if %boo_alltask_run% equ 0 goto :eof


call %root_path%utils\utils_sp_get.bat alltask_last_check_time    
call %root_path%utils\utils_gettimestamp_hms.bat alltask_now_check_time 

set /a "sec_count=%alltask_now_check_time%-%alltask_last_check_time%"
echo 距离上次全程序检测时间：%sec_count%

if %sec_count% lss 1205 ( 
	goto :eof
) 

 
set "allday_param=%1"
 
set "alltask_has_run_result=0"

rem 部分程序不参加此判断
if %allday_param% equ 5 goto :eof
if %allday_param% equ 6 goto :eof

rem 如果为当前程序不参加此次判断

if %allday_param% neq 3 call %root_path%pro_douyin\douyin_run.bat 0 901 
if %allday_param% neq 3 call %root_path%pro_douyin\douyin_run.bat 0 902
if %allday_param% neq 3 call %root_path%pro_douyin\douyin_run.bat 0 903
if %allday_param% neq 3 call %root_path%pro_douyin\douyin_run.bat 0 904

if %allday_param% neq 4 call %root_path%pro_kuaishou\kuaishou_run.bat 0 901

if %allday_param% neq 5 call %root_path%pro_kuaishou\kuaishou_run.bat 0 901

 
::---------------------
 
call %root_path%utils\utils_gettimestamp_hms.bat alltask_last_check_time
call %root_path%utils\utils_sp_put.bat alltask_last_check_time %alltask_last_check_time%   
 
echo 是否有可执行程序%alltask_has_run_result%
if %alltask_has_run_result% equ 0 goto :eof

 
echo 回到源程序%allday_param%

if %allday_param% equ 0  call %root_path%utils\utils_close.bat

 
if %allday_param% equ 3  call %root_path%pro_douyin\douyin_run.bat 0 400


if %allday_param% equ 4  call %root_path%pro_kuaishou\kuaishou_run.bat 0 400


if %allday_param% equ 5  call %root_path%pro_taobao\taobao_run.bat 0 400


 
goto :eof
 
 
 