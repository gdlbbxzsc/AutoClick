 
::=================
echo 配置变量快手

echo 设置运行程序模式
 
set "boo_taobao_kanzhibo=0" 
set "boo_taobao_kanshipin=1" 

::-------------------------------------------
echo 设置时间变量
 rem 宝箱间隔
set "taobao_baoxiangjiange=40"

rem 看视频总时长
set "taobao_kanshipinzongshichang=10800"

rem 看直播总时长
set "taobao_kanzhibozongshichang=3600"

  
::-------------------------------------------------
echo 设置点击变量


::基本不变的坐标------------不太需要修改 

rem 点击宝箱 x y
set "taobao_tap_go_bao_xiang_x=892"
set "taobao_tap_go_bao_xiang_y=1393"
 
rem 关闭宝箱 x y
set "taobao_tap_close_bao_xiang_x=546"
set "taobao_tap_close_bao_xiang_y=1374"


  
::可能会改变的坐标需要和前一天的界面进行对比看是否有变化----------------------------------

rem 滑动到直播按钮 x y 请将滑动值分三次 
set "taobao_swipe_to_zhibo_y=1000"  

rem 点击直播 x y 
set "taobao_tap_go_zhibo_x=941"
set "taobao_tap_go_zhibo_y=1206"


rem 滑动到视频按钮 x y 请将滑动值分三次 
set "taobao_swipe_to_shipin_y=1000"  

rem 点击视频 x y 
set "taobao_tap_go_shipin_x=941"
set "taobao_tap_go_shipin_y=1206"
 
::=================