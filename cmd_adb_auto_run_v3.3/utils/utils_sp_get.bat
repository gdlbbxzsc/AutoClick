set "%1=1" 
rem echo %1-------1>:%%1%
::=======
 
set "config_file_today=%date:~0,4%%date:~5,2%%date:~8,2%"
rem echo config_file_today:%config_file_today%
 
if not exist %sp_path%%config_file_today%.txt  goto :eof


set "config_file_name_pre=%1"
rem echo config_file_name_pre:%config_file_name_pre%
 
set "config_file_name=%sp_path%%config_file_today%_%config_file_name_pre%.txt" 
rem echo %config_file_name%
 
if not exist %config_file_name%  goto :eof

rem set /P temp=<%config_file_name%
rem echo temp:%temp%

set /P %1=<%config_file_name%
rem echo %1-------2>:%%1%

goto :eof
 















