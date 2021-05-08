package com.pbph.autoclick.service.task;


import android.view.accessibility.AccessibilityNodeInfo;

import com.pbph.autoclick.BaseTaskQueue;
import com.pbph.autoclick.Myapplication;
import com.pbph.autoclick.service.AbstractTF;
import com.pbph.autoclick.service.AccessibilityServiceFindUtils;

public class SwipeQueue extends BaseTaskQueue {


    public static SwipeQueue getInstance() {
        return SwipeQueue.InnerInstance.INSTANCE;
    }


    private static class InnerInstance {
        private static final SwipeQueue INSTANCE = new SwipeQueue();
    }

    private SwipeQueue() {
    }


    @Override
    public void onAccessibilityEvent() {
    }

    @Override
    public void run() {

        while (true) {

            try {
                Thread.sleep(Myapplication.time * 1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (!Myapplication.isRun) {
                return;
            }
            AccessibilityNodeInfo nd = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newClassName("dmt.viewpager.DmtViewPager-c", true));
            if (nd != null)
                nd.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);


        }
    }

}
