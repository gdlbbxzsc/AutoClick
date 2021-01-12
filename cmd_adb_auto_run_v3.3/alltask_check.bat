echo 运行全程序检查任务:%boo_alltask_run%
if %boo_alltask_run% equ 0 goto :eof
 
set "allday_param=%1"
 
set "alltask_has_run_result=0"

rem 部分程序不参加此判断
if %allday_param% equ 5 goto :eof

rem 如果为当前程序不参加此次判断
if %allday_param% neq 3 call %root_path%pro_douyin\douyin_run.bat 0 901 
if %allday_param% neq 3 call %root_path%pro_douyin\douyin_run.bat 0 902

if %allday_param% neq 4 call %root_path%pro_kuaishou\kuaishou_run.bat 0 901

 
::---------------------

echo 是否有可执行程序%alltask_has_run_result%
if %alltask_has_run_result% equ 0 goto :eof

 
echo 回到源程序%allday_param%

if %allday_param% equ 3  call %root_path%pro_douyin\douyin_run.bat 0 400


if %allday_param% equ 4  call %root_path%pro_kuaishou\kuaishou_run.bat 0 400


if %allday_param% equ 5  call %root_path%pro_taobao\taobao_run.bat 0 400


 
goto :eof
 
 
 