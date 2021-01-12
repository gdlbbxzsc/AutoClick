if not exist %sp_path% ( 
	md %sp_path%
	echo 创建文件目录
)


set "config_file_today=%date:~0,4%%date:~5,2%%date:~8,2%"
rem echo config_file_today:%config_file_today%
 
if not exist %sp_path%%config_file_today%.txt (
	del %sp_path%*.txt
	echo off >%sp_path%%config_file_today%.txt
)


set "config_file_name_pre=%1"
rem echo config_file_name_pre:%config_file_name_pre%

set "config_file_value=%2"
rem echo config_file_value:%config_file_value%

 
set "config_file_name=%sp_path%%config_file_today%_%config_file_name_pre%.txt" 
rem echo %config_file_name%

if not exist %config_file_name% ( 
	echo off >%config_file_name%
)

echo %config_file_value% >%config_file_name%
 