package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.app.Notification;
import android.app.PendingIntent;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityEvent;

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

        int action = event.getAction();
        int contentChangeTypes = event.getContentChangeTypes();
        int eventType = event.getEventType();
        long eventTime = event.getEventTime();


        switch (eventType) {
            case AccessibilityEvent.TYPE_VIEW_CLICKED: {//界面点击
            }
            break;
            case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED: {  //界面文字改动
            }
            break;
            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED: {
            }
            break;
            case AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED: {//通知
                notification_wx(event);
            }
            break;
        }
    }

    private boolean notification_wx(AccessibilityEvent event) {
        Parcelable parcelable = event.getParcelableData();
        if (parcelable == null) return false;

        if (!(parcelable instanceof Notification)) return false;

        Notification notification = (Notification) parcelable;

        String content = notification.tickerText.toString();

        if (!(content.contains("[微信红包]"))) return false;

        PendingIntent pendingIntent = notification.contentIntent;
        try {
            pendingIntent.send();
        } catch (PendingIntent.CanceledException e) {
            e.printStackTrace();
        }
        return true;
    }

}
