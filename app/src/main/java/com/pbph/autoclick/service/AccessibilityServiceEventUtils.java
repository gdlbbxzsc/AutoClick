package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.view.accessibility.AccessibilityNodeInfo;

import androidx.annotation.RequiresApi;

public final class AccessibilityServiceEventUtils {


    //    点击返回
    public static boolean back(AccessibilityService service) {
        return service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK);
    }

    //    点击home
    public static boolean home(AccessibilityService service) {
        return service.performGlobalAction(AccessibilityService.GLOBAL_ACTION_HOME);
    }

    //    点击该控件 true表示点击成功
    public static boolean click(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isClickable()) return false;
        boolean b = nodeInfo.performAction(AccessibilityNodeInfo.ACTION_CLICK);
        nodeInfo.recycle();
        return b;
    }

    //    点击该控件 true表示点击成功如果当前控件不可点击 查找其父类控件进行点击
    public static boolean clickOrParent(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        Log.e("===>", "clickOrParent: " +nodeInfo.getClassName() );
        if (!nodeInfo.isClickable()) return clickOrParent(nodeInfo.getParent());
        boolean b = nodeInfo.performAction(AccessibilityNodeInfo.ACTION_CLICK);
        nodeInfo.recycle();
        return b;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public static boolean click7(AccessibilityService service, AccessibilityNodeInfo nodeInfo) {
        Rect absXY = new Rect();
        nodeInfo.getBoundsInScreen(absXY);
        return click7(service, getCenter(absXY));
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public static boolean click7(AccessibilityService service, Point point) {
        return click7(service, point.x, point.y);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public static boolean click7(AccessibilityService service, int x, int y) {
        Path path = new Path();
        path.moveTo(x - 1, y - 1);
        path.lineTo(x + 1, y + 1);
        return service.dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription
                (path, 0, 100)).build(), null, null);
    }

    //
    //
    //
    //
    //
    //
    public static boolean longClick(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isLongClickable()) return false;
        boolean b = nodeInfo.performAction(AccessibilityNodeInfo.ACTION_LONG_CLICK);
        nodeInfo.recycle();
        return b;
    }

    public static boolean longClickOrParent(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isLongClickable()) return longClickOrParent(nodeInfo.getParent());
        boolean b = nodeInfo.performAction(AccessibilityNodeInfo.ACTION_LONG_CLICK);
        nodeInfo.recycle();
        return b;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public static boolean longClick7(AccessibilityService service, AccessibilityNodeInfo nodeInfo) {
        Rect absXY = new Rect();
        nodeInfo.getBoundsInScreen(absXY);
        return longClick7(service, getCenter(absXY));
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public static boolean longClick7(AccessibilityService service, Point point) {
        return longClick7(service, point.x, point.y);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public static boolean longClick7(AccessibilityService service, int x, int y) {
        Path path = new Path();
        path.moveTo(x - 1, y - 1);
        path.lineTo(x, y - 1);
        path.lineTo(x, y);
        path.lineTo(x - 1, y);
        return service.dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription
                (path, 0, 1000)).build(), null, null);
    }

    //
    //
    //
    //
    //
    //
    @RequiresApi(api = Build.VERSION_CODES.N)
    public boolean move7(AccessibilityService service, Path path, long mills) {
        return service.dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription
                (path, 0, mills)).build(), null, null);
    }

    //
    //
    //
    //
    //
    //
    public static Point getCenter(Rect absXY) {
        Point point = new Point();
        point.x = absXY.left + (absXY.right - absXY.left) / 2;
        point.y = absXY.top + (absXY.bottom - absXY.top) / 2;
        return point;
    }
}
