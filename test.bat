::进入d盘
d:
::进入adb命令目录
cd D:\dev\Android\sdk\platform-tools
::执行 adb shell 命令 和 点击坐标668 581 命令
adb shell input tap 668 581 
::暂停五秒
ping /n 1 5000 1.0.0.1>nul
::点击任意退出 保证bat命令执行完后不立即关闭窗口
pause



::点击home按键
adb shell input keyevent 3

::滑动
adb shell input swipe 300 300 400 400

::点亮屏幕
adb shell input keyevent 224
::打开系统设置
adb shell input keyevent 176	
::返回键
adb shell input keyevent 4	