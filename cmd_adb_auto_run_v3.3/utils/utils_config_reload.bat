if "%1"=="r" ( 
	echo ����ͨ�������ļ� 
	call %root_path%base_config\base\%app_name%\config_reload.bat
	echo �����Զ��������ļ�
	call %root_path%base_config\custom\%device_name%\%app_name%\config_reload.bat
)