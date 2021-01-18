package com.pbph.autoclick.service;

import android.app.Notification;
import android.app.PendingIntent;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityEvent;

public final class Wx_HongBao {


    public static final void onAccessibilityEvent(AccessibilityEvent event) {

        int action = event.getAction();
        int contentChangeTypes = event.getContentChangeTypes();
        int eventType = event.getEventType();//事件类型
        long eventTime = event.getEventTime();


        switch (eventType) {
            case AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED: {//Notification通知变化
                notification_wx(event);
            }
            break;

        }
    }

    private static final boolean notification_wx(AccessibilityEvent event) {
        Parcelable parcelable = event.getParcelableData();
        if (parcelable == null) return false;

        if (!(parcelable instanceof Notification)) return false;

        Notification notification = (Notification) parcelable;

        String content = notification.tickerText.toString();

        if (!(content.contains("[微信红包]"))) return false;

        PendingIntent pendingIntent = notification.contentIntent;
        try {
            pendingIntent.send();
            return true;
        } catch (PendingIntent.CanceledException e) {
            e.printStackTrace();
            return false;
        }
    }
}
