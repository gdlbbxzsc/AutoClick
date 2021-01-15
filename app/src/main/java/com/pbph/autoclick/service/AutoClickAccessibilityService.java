package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.text.TextUtils;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import androidx.annotation.RequiresApi;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;

//https://blog.csdn.net/siyujiework/article/details/88996145 root权限下 自动授权无障碍
//https://www.jianshu.com/p/4cd8c109cdfb 参考
//     AccessibilityEvent    https://blog.csdn.net/sqlaowen/article/details/85100173
// api  http://www.android-doc.com/reference/android/view/accessibility/AccessibilityEvent.html

public class AutoClickAccessibilityService extends AccessibilityService {

    @Override
    public void onInterrupt() {
    }

    //初始化
    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
    }

    //实现辅助功能
    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        event.getAction();
        event.getContentChangeTypes();
        event.getEventType();
        event.getEventTime();

        int eventType = event.getEventType();
        switch (eventType) {
            case AccessibilityEvent.TYPE_VIEW_CLICKED: {//界面点击
            }
            break;
            case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED: {  //界面文字改动
            }
            break;
        }
    }

}
