::����d��
d:
::����adb����Ŀ¼
cd D:\dev\Android\sdk\platform-tools
::ִ�� adb shell ���� �� �������668 581 ����
adb shell input tap 668 581 
::��ͣ����
ping /n 1 5000 1.0.0.1>nul
::��������˳� ��֤bat����ִ����������رմ���
pause



::���home����
adb shell input keyevent 3

::����
adb shell input swipe 300 300 400 400

::������Ļ
adb shell input keyevent 224
::��ϵͳ����
adb shell input keyevent 176	
::���ؼ�
adb shell input keyevent 4	