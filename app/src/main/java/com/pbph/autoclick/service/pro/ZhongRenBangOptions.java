package com.pbph.autoclick.service.pro;

import android.accessibilityservice.AccessibilityService;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import com.pbph.autoclick.Constant;
import com.pbph.autoclick.service.AbstractTF;
import com.pbph.autoclick.service.AccessibilityServiceEventUtils;
import com.pbph.autoclick.service.AccessibilityServiceFindUtils;
import com.pbph.autoclick.service.AutoClickAccessibilityService;
import com.pbph.autoclick.service.BaseOptions;
import com.pbph.autoclick.uitils.FileHelper;
import com.pbph.autoclick.uitils.Logger;
import com.pbph.autoclick.uitils.StringUtils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public final class ZhongRenBangOptions extends BaseOptions {

    public static ZhongRenBangOptions getInstance() {
        return InnerInstance.INSTANCE;
    }

    private static class InnerInstance {
        private static final ZhongRenBangOptions INSTANCE = new ZhongRenBangOptions();
    }

    private ZhongRenBangOptions() {
    }


    public void onAccessibilityEvent() {
        switch (eventType) {
            case AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED:  //窗口的内容发生变化，或子树根布局发生变化
            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED: {//打开了一个PopupWindow，Menu或Dialog
                taskList(event);
                taskDetail(event);
            }
            break;
        }
    }


    public boolean taskList(AccessibilityEvent event) {


        if (!StringUtils.isPackage(event, Constant.PKG_ZRB)) return false;

        AccessibilityNodeInfo content_bar_title = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/hall_tab"));

        if (content_bar_title == null || !"悬赏大厅".equals(content_bar_title.getText().toString()))
            return false;

        AccessibilityServiceEventUtils.clickOrParent(content_bar_title);

//
//        List<AccessibilityNodeInfo> item_titleList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_title"));
//        List<AccessibilityNodeInfo> item_gongziList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_gongzi"));
//
//        List<AccessibilityNodeInfo> item_detailList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_detail"));
//        List<AccessibilityNodeInfo> item_leftList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_left"));
//
//        List<AccessibilityNodeInfo> missiontypeList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/missiontype"));
//        List<AccessibilityNodeInfo> missionnameList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/missionname"));
//
//        boolean b = AccessibilityServiceEventUtils.clickOrParent(item_detailList.get(0));
//        write("click", "a b");
        return true;
    }

    public boolean taskDetail(AccessibilityEvent event) {


        AccessibilityNodeInfo content_bar_title = AccessibilityServiceFindUtils.findFirst(AutoClickAccessibilityService.getInstances().getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/content_bar_title"));
        if (content_bar_title == null || !"悬赏详情".equals(content_bar_title.getText().toString()))
            return false;

        AccessibilityNodeInfo limite = AccessibilityServiceFindUtils.findFirst(AutoClickAccessibilityService.getInstances().getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/limite"));


        AccessibilityNodeInfo btn_add = AccessibilityServiceFindUtils.findFirst(AutoClickAccessibilityService.getInstances().getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/btn_add"));

        return true;
    }


}
