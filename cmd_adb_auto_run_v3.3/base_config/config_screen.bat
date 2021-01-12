:: set "wm_width=%%a"
:: set "wm_height=%%b" 


::中心点
set /a "center_x=%wm_width%/2"
set /a "center_y=%wm_height%/2"
 
::距离屏幕各边10像素位置
set "top_10=10"
set "left_10=10"
set "right_10=%wm_width%"
set "bottom_10=%wm_height%"   

::屏幕高度1/8
set "height_1_8=%wm_height%/8"
set "height_6_8=%wm_height%/8*6"