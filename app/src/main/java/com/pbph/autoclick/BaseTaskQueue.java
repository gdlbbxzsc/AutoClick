package com.pbph.autoclick;


import android.view.accessibility.AccessibilityEvent;

import com.pbph.autoclick.service.AutoClickAccessibilityService;
import com.pbph.autoclick.uitils.Logger;

import java.util.ArrayList;
import java.util.List;

public abstract class BaseTaskQueue implements Runnable {

    public List<Opts> queue = new ArrayList<Opts>();

    private volatile boolean run = false;


    public AutoClickAccessibilityService service;

//    public volatile AccessibilityEvent event;
    public int action;
    public int contentChangeTypes;
    public int eventType;//事件类型
    public long eventTime;

    public String mPackageName;

    public void onAccessibilityEvent(AccessibilityEvent event) {

        Logger.e("onAccessibilityEvent");
        if (service == null) service = AutoClickAccessibilityService.getInstances();

        mPackageName = event.getPackageName().toString();

        action = event.getAction();
        contentChangeTypes = event.getContentChangeTypes();
        eventType = event.getEventType();//事件类型
        eventTime = event.getEventTime();

//        log("action:" + action);
//        log("contentChangeTypes:" + contentChangeTypes);
//        log("eventType:" + eventType);
//        log("eventTime:" + eventTime);

        onAccessibilityEvent();

        start();
    }

    public abstract void onAccessibilityEvent();


    public synchronized boolean checkRunTask(Opts opts, onCheckRunTaskDoListener listener) {

        if (queue.indexOf(opts) != 0) return false;

        boolean b = true;
        if (listener != null) b = listener.onCheckRunTaskDo();

        if (b) queue.remove(0);

        return true;
    }


    public synchronized void add(Opts opts) {
        queue.add(opts);
    }

    public synchronized void insert(Opts opts) {
        queue.add(0, opts);
    }

    public synchronized void clear() {
        queue.clear();
    }

    public synchronized void start() {
        if (run) return;
        this.run = true;
        new Thread(this).start();
    }

    public synchronized void stop() {
//        this.run = false;
        clear();
        onDestroy();
    }

    public boolean contains(Opts opts) {
        return queue.contains(opts);
    }

    public void onDestroy() {
    }

    public interface onCheckRunTaskDoListener {
        boolean onCheckRunTaskDo();
    }
}
