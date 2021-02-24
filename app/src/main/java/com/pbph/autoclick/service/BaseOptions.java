package com.pbph.autoclick.service;

import android.app.Notification;
import android.app.PendingIntent;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import com.pbph.autoclick.Constant;
import com.pbph.autoclick.uitils.StringUtils;

import java.util.List;

public abstract class BaseOptions {

    public AutoClickAccessibilityService service;

    public AccessibilityEvent event;
    public int action;
    public int contentChangeTypes;
    public int eventType;//事件类型
    public long eventTime;

    public void onAccessibilityEvent(AccessibilityEvent event) {
        
        service = AutoClickAccessibilityService.getInstances();

        this.event = event;

        action = event.getAction();
        contentChangeTypes = event.getContentChangeTypes();
        eventType = event.getEventType();//事件类型
        eventTime = event.getEventTime();

//        log("action:" + action);
//        log("contentChangeTypes:" + contentChangeTypes);
//        log("eventType:" + eventType);
//        log("eventTime:" + eventTime);

        onAccessibilityEvent();

        this.event = null;
    }

    public abstract void onAccessibilityEvent();

}
