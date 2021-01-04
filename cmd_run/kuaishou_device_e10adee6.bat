title e10adee6-vivo
::=================
echo 配置变量快手

echo 设置运行程序模式
 
set "boo_kanzhibo=0" 
set "boo_kanshipin=1" 

::-------------------------------------------
echo 设置时间变量
 rem 宝箱间隔
set "baoxiangjiange=1210"

rem 看视频总时长
set "kanshipinzongshichang=10800" 

  
::-------------------------------------------------
echo 设置点击变量


::基本不变的坐标------------不太需要修改
rem 点击去赚钱 x y
set "tap_go_zhuan_qian_x=82"
set "tap_go_zhuan_qian_y=631"

rem 点击宝箱 x y
set "tap_go_bao_xiang_x=611"
set "tap_go_bao_xiang_y=943"

rem 点击宝箱广告 x y
set "tap_go_bao_xiang_guang_gao_x=360"
set "tap_go_bao_xiang_guang_gao_y=793"


rem 点击继续播放视频 x y------------------
set "tap_jixubofangshipin_x=563"
set "tap_jixubofangshipin_y=1264"


::可能会改变的坐标需要和前一天的界面进行对比看是否有变化----------------------------------

rem 滑动到直播按钮 x y 请将滑动值分三次 
set "swipe_to_zhibo_y=500"  

rem 点击直播 x y---------------
set "tap_go_zhibo_x=635"
set "tap_go_zhibo_y=807"
 
::=================