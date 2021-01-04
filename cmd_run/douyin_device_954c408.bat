title 954c408-china
::=================
echo 配置变量抖音

echo 设置运行程序模式

set "boo_kanxiaoshuo=0"
set "boo_zoulu=0"
set "boo_kanzhibo=0"
set "boo_kanshipin=1"
set "boo_kanguanggao=1"
set "boo_kanbaoxiangguanggao=1"

::-------------------------------------------
echo 设置时间变量

rem 宝箱间隔
set "baoxiangjiange=1210"

rem 看视频总时长
set "kanshipinzongshichang=10800"

rem 看直播总时长
set "kanzhibozongshichang=1800"

rem 收直播红包间隔
set "shouzhibohongbaojiange=181"

rem 去看广告任务间隔
set "qukanguanggaorenwujiange=1210"
::-------------------------------------------------
echo 设置点击变量

::基本不变的坐标------------不太需要修改
rem 点击去赚钱 x y
set "tap_go_zhuan_qian_x=549"
set "tap_go_zhuan_qian_y=1831"

rem 点击宝箱 x y
set "tap_go_bao_xiang_x=922"
set "tap_go_bao_xiang_y=1746"

rem 点击宝箱广告 x y
set "tap_go_bao_xiang_guang_gao_x=431"
set "tap_go_bao_xiang_guang_gao_y=1154"

rem 关闭宝箱 x y
set "tap_close_bao_xiang_x=546"
set "tap_close_bao_xiang_y=1374"

rem 点击去看直播 x y
set "tap_go_zhi_bo_x=64"
set "tap_go_zhi_bo_y=155"

rem 直播红包 x y
set "tap_zhi_bo_hongbao_x=55"
set "tap_zhi_bo_hongbao_y=369"

rem 直播红包shouxia x y
set "tap_zhi_bo_hongbao_get_x=333"
set "tap_zhi_bo_hongbao_get_y=1061"










::可能会改变的坐标需要和前一天的界面进行对比看是否有变化----------------------------------

rem 滑动到广告按钮 x y 请将滑动值分三次
set "swipe_to_guanggao_y=200"  

rem 点击广告 x y
set "tap_go_guang_gao_x=859"
set "tap_go_guang_gao_y=1166"

rem 滑动到看小说按钮 x y 请将滑动值分三次
set "swipe_to_kanxiaoshuo_y=1000"  

rem 点击看小说 x y
set "tap_go_kanxiaoshuo_x=887"
set "tap_go_kanxiaoshuo_y=991"

rem 点击看小说书名 x y 
set "tap_go_kanxiaoshuo_name_y=914"

rem 小说翻页 x y 
set "tap_to_swipe_xiaoshuo_x=1050"
set "tap_to_swipe_xiaoshuo_y=449"

rem 滑动到走路按钮 x y 请将滑动值分三次 
set "swipe_to_zoulu_y=1000"  

rem 点击走路 x y
set "tap_go_zoulu_x=887"
set "tap_go_zoulu_y=719"

rem 点击走路收钱 x y
set "tap_shou_zoulu_x=542"
set "tap_shou_zoulu_y=972"

rem 滑动到吃饭按钮 x y 请将滑动值分三次 ----------
set "swipe_to_chifan_y=1000"  

rem 点击吃饭 x y----------
set "tap_go_chifan_x=892"
set "tap_go_chifan_y=1023"

rem 点击吃饭收钱 x y-------------
set "tap_shou_chifan_x=542"
set "tap_shou_chifan_y=972"

::=================