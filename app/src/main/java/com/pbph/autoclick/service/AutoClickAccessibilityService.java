package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.text.TextUtils;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

//https://blog.csdn.net/siyujiework/article/details/88996145
//https://blog.csdn.net/tangpunang5844/article/details/86699572
//https://blog.csdn.net/weimingjue/article/details/82744146
//可参考 https://www.jianshu.com/p/4cd8c109cdfb
public class AutoClickAccessibilityService extends AccessibilityService {

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {


        int eventType = event.getEventType();
        switch (eventType) {
            case AccessibilityEvent.TYPE_VIEW_CLICKED:
                //界面点击
                break;
            case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED:
                //界面文字改动
                break;
        }

        AccessibilityNodeInfo rootInfo = getRootInActiveWindow();
        DFS(rootInfo);
    }

    @Override
    public void onInterrupt() {
    }

    /**
     * 深度优先遍历寻找目标节点
     */
    private void DFS(AccessibilityNodeInfo rootInfo) {
        if (rootInfo == null || TextUtils.isEmpty(rootInfo.getClassName())) {
            return;
        }
        if (!"android.widget.GridView".equals(rootInfo.getClassName())) {
            for (int i = 0; i < rootInfo.getChildCount(); i++) {
                DFS(rootInfo.getChild(i));
            }
        } else {
            AccessibilityNodeInfo GridViewInfo = rootInfo;
            for (int i = 0; i < GridViewInfo.getChildCount(); i++) {
                final AccessibilityNodeInfo frameLayoutInfo = GridViewInfo.getChild(i);
                final AccessibilityNodeInfo childInfo = frameLayoutInfo.getChild(0);
                String text = childInfo.getText().toString();
                if (text.equals("专栏")) {
                    performClick(frameLayoutInfo);
                }
            }
        }
    }

    private void performClick(AccessibilityNodeInfo targetInfo) {
        targetInfo.performAction(AccessibilityNodeInfo.ACTION_CLICK);
    }
}
