echo ��ȡͨ�������ļ� 
call %root_path%base_config\base\%app_name%\config_boo.bat
call %root_path%base_config\base\%app_name%\config_click.bat
call %root_path%base_config\base\%app_name%\config_time.bat

call %root_path%base_config\base\%app_name%\constant.bat

echo ��ȡ�Զ��������ļ�
call %root_path%base_config\custom\%device_name%\%app_name%\config_boo.bat
call %root_path%base_config\custom\%device_name%\%app_name%\config_click.bat
call %root_path%base_config\custom\%device_name%\%app_name%\config_time.bat
 


