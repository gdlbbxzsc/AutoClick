package com.pbph.autoclick;

import android.accessibilityservice.AccessibilityService;
import android.app.Application;

public class Myapplication extends Application {
    private static Myapplication instances;


    public static Myapplication getInstances() {
        return instances;
    }

    public static volatile int time = 5;
    public static volatile boolean isRun = false;

    @Override
    public void onCreate() {
        super.onCreate();
        instances = this;
    }

}
