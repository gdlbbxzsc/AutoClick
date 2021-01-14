 
::中心点
set /a "center_x=%wm_width%/2"
set /a "center_y=%wm_height%/2"
 
::距离屏幕各边10像素位置
set "top_10=10"
set "left_10=10"
set /a "right_10=%wm_width%-10"
set /a "bottom_10=%wm_height%-10"   

::屏幕高度1/8 6/8
set /a "height_1_8=%wm_height%/8"
set /a "height_6_8=%wm_height%/8*6"

echo center:%center_x%    %center_y% 

echo -10:%right_10%    %bottom_10% 

echo 16:%height_1_8%    %height_6_8% 