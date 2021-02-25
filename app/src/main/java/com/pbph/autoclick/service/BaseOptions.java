package com.pbph.autoclick.service;

import android.view.accessibility.AccessibilityEvent;

public abstract class BaseOptions {

    public AutoClickAccessibilityService service;

    public AccessibilityEvent event;

    public void onAccessibilityEvent(AccessibilityEvent event) {
        if (service == null) service = AutoClickAccessibilityService.getInstances();

        this.event = event;
    }

    public void onDestroy() {
        this.event = null;
        this.service = null;
    }
}
