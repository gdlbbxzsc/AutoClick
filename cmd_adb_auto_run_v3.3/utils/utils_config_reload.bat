if "%1"=="r" ( 
	echo 重载通用配置文件 
	call %root_path%base_config\base\%app_name%\config_reload.bat
	echo 重载自定义配置文件
	call %root_path%base_config\custom\%device_name%\%app_name%\config_reload.bat
)