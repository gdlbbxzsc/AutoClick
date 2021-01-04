title 954c408-china
::=================
echo 配置变量快手

echo 设置运行程序模式
 
set "boo_kuaishou_kanzhibo=0" 
set "boo_kuaishou_kanshipin=1" 

::-------------------------------------------
echo 设置时间变量
 rem 宝箱间隔
set "kuaishou_baoxiangjiange=1210"

rem 看视频总时长
set "kuaishou_kanshipinzongshichang=10800"

  
::-------------------------------------------------
echo 设置点击变量


::基本不变的坐标------------不太需要修改
rem 点击去赚钱 x y
set "kuaishou_tap_go_zhuan_qian_x=123"
set "kuaishou_tap_go_zhuan_qian_y=850"

rem 点击宝箱 x y
set "kuaishou_tap_go_bao_xiang_x=892"
set "kuaishou_tap_go_bao_xiang_y=1393"

rem 点击宝箱广告 x y
set "kuaishou_tap_go_bao_xiang_guang_gao_x=522"
set "kuaishou_tap_go_bao_xiang_guang_gao_y=1200"


rem 点击继续播放视频 x y
set "kuaishou_tap_jixubofangshipin_x=563"
set "kuaishou_tap_jixubofangshipin_y=1264"


::可能会改变的坐标需要和前一天的界面进行对比看是否有变化----------------------------------

rem 滑动到直播按钮 x y 请将滑动值分三次 
set "kuaishou_swipe_to_zhibo_y=1000"  

rem 点击直播 x y 
set "kuaishou_tap_go_zhibo_x=941"
set "kuaishou_tap_go_zhibo_y=1206"
 
::=================