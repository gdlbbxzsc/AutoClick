package com.pbph.autoclick;

import android.accessibilityservice.AccessibilityService;
import android.app.Application;

public class Myapplication extends Application {
    private static Myapplication instances;


    public static Myapplication getInstances() {
        return instances;
    }


    @Override
    public void onCreate() {
        super.onCreate();
        instances = this;
    }

}
