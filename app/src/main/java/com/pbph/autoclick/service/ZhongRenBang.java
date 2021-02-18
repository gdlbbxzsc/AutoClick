package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import com.pbph.autoclick.uitils.FileHelper;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.List;

public final class ZhongRenBang {
    private static AccessibilityService service;

    public static final void onAccessibilityEvent(AccessibilityService service, AccessibilityEvent event) {
        String packageName = (String) event.getPackageName();
        if (packageName == null || !"com.jianzhiku.zhongrenbang".equals(packageName)) return;

        ZhongRenBang.service = service;

        int action = event.getAction();
        int contentChangeTypes = event.getContentChangeTypes();
        int eventType = event.getEventType();//事件类型
        long eventTime = event.getEventTime();

//        log("action:" + action);
//        log("contentChangeTypes:" + contentChangeTypes);
//        log("eventType:" + eventType);
//        log("eventTime:" + eventTime);

        switch (eventType) {
            case AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED:  //窗口的内容发生变化，或子树根布局发生变化
            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED: {//打开了一个PopupWindow，Menu或Dialog
                taskList(event);
                taskDetail(event);
            }
            break;

        }
    }


    private static void log(String str) {
        Log.e("====>", str);
    }

    private static boolean b = false;

    private static final void taskList(AccessibilityEvent event) {
        if (b) return;

        b = true;


        AccessibilityNodeInfo content_bar_title = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/content_bar_title"));
        if (content_bar_title == null || !"悬赏大厅".equals(content_bar_title.getText().toString()))return;

        List<AccessibilityNodeInfo> item_titleList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_title"));
        List<AccessibilityNodeInfo> item_gongziList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_gongzi"));

        List<AccessibilityNodeInfo> item_detailList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_detail"));
        List<AccessibilityNodeInfo> item_leftList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/item_left"));

        List<AccessibilityNodeInfo> missiontypeList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/missiontype"));
        List<AccessibilityNodeInfo> missionnameList = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/missionname"));

        boolean b = AccessibilityServiceEventUtils.clickOrParent(item_detailList.get(0));
//        write("click", "a b");

    }

    private static final void taskDetail(AccessibilityEvent event) {
        if (b) return;

        b = true;


        AccessibilityNodeInfo content_bar_title = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/content_bar_title"));
        if (content_bar_title == null || !"悬赏详情".equals(content_bar_title.getText().toString()))return;

        AccessibilityNodeInfo limite = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/limite"));


        AccessibilityNodeInfo btn_add = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId("com.jianzhiku.zhongrenbang:id/btn_add"));




    }


    public static String read(String fileName) {
        try {
            File file = FileHelper.getInstance().toAppPath().fileName(fileName).create(true);
            BufferedReader br = new BufferedReader(new FileReader(file));
            String readline = "";
            StringBuffer sb = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                sb.append(readline);
            }
            br.close();
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static void write(String fileName, String info) {
        try {
            File file = FileHelper.getInstance().toAppPath().fileName(fileName).create(true);
            log(file.getAbsolutePath());
            //第二个参数意义是说是否以append方式添加内容
            BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
            bw.write(info);
            bw.flush();
            bw.close();
            log("写入成功" + file.getAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
