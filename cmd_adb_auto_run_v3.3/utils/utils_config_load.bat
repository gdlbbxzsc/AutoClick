echo 读取通用配置文件 
call %root_path%base_config\base\%app_name%\config_boo.bat
call %root_path%base_config\base\%app_name%\config_click.bat
call %root_path%base_config\base\%app_name%\config_time.bat

call %root_path%base_config\base\%app_name%\constant.bat

echo 读取自定义配置文件
call %root_path%base_config\custom\%device_name%\%app_name%\config_boo.bat
call %root_path%base_config\custom\%device_name%\%app_name%\config_click.bat
call %root_path%base_config\custom\%device_name%\%app_name%\config_time.bat
 


