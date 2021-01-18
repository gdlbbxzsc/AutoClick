package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.app.Notification;
import android.app.PendingIntent;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityEvent;

//https://blog.csdn.net/siyujiework/article/details/88996145 root权限下 自动授权无障碍
//参考    https://www.jianshu.com/p/4cd8c109cdfb
//api     http://www.android-doc.com/reference/android/view/accessibility/AccessibilityEvent.html

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
            case AccessibilityEvent.TYPE_VIEW_CLICKED: {//View被点击
            }
            case AccessibilityEvent.TYPE_VIEW_LONG_CLICKED: {//View被长按
            }
            case AccessibilityEvent.TYPE_VIEW_SELECTED: {//View被选中
            }
            case AccessibilityEvent.TYPE_VIEW_FOCUSED: {//View获得焦点
            }
            case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED: {//View文本变化
            }
            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED: {//打开了一个PopupWindow，Menu或Dialog
            }
            case AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED: {//Notification通知变化
                notification_wx(event);
            }
            case AccessibilityEvent.TYPE_VIEW_HOVER_ENTER: {//一个View进入悬停
            }
            case AccessibilityEvent.TYPE_VIEW_HOVER_EXIT: {//一个View退出悬停
            }
            case AccessibilityEvent.TYPE_TOUCH_EXPLORATION_GESTURE_START: {//触摸浏览事件开始
            }
            case AccessibilityEvent.TYPE_TOUCH_EXPLORATION_GESTURE_END: {//触摸浏览事件完成
            }
            case AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED: {//窗口的内容发生变化，或子树根布局发生变化
            }
            case AccessibilityEvent.TYPE_VIEW_SCROLLED: {//View滚动
            }
            case AccessibilityEvent.TYPE_VIEW_TEXT_SELECTION_CHANGED: {//Edittext文字选中发生改变事件
            }
            case AccessibilityEvent.TYPE_ANNOUNCEMENT: {//应用产生一个通知事件
            }
            case AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED: {//获得无障碍焦点事件
            }
            case AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED: {//无障碍焦点事件清除
            }
            case AccessibilityEvent.TYPE_VIEW_TEXT_TRAVERSED_AT_MOVEMENT_GRANULARITY: {//在给定的移动粒度下遍历视图文本的事件
            }
            case AccessibilityEvent.TYPE_GESTURE_DETECTION_START: {//开始手势监测
            }
            case AccessibilityEvent.TYPE_GESTURE_DETECTION_END: {//结束手势监测
            }
            case AccessibilityEvent.TYPE_TOUCH_INTERACTION_START: {//触摸屏幕事件开始
            }
            case AccessibilityEvent.TYPE_TOUCH_INTERACTION_END: {//触摸屏幕事件结束
            }
            case AccessibilityEvent.TYPE_WINDOWS_CHANGED: {//屏幕上的窗口变化事件，需要API                                                 21+
            }
            case AccessibilityEvent.TYPE_VIEW_CONTEXT_CLICKED: {//View中的上下文点击事件
            }
            case AccessibilityEvent.TYPE_ASSIST_READING_CONTEXT: {//辅助用户读取当前屏幕事件
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
