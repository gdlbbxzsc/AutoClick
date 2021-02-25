package com.pbph.autoclick.service.task;


import android.text.TextUtils;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import com.pbph.autoclick.BaseTaskQueue;
import com.pbph.autoclick.Constant;
import com.pbph.autoclick.Opts;
import com.pbph.autoclick.service.pro.WxOptions;
import com.pbph.autoclick.uitils.Logger;
import com.pbph.autoclick.uitils.StringUtils;

import java.util.List;

public class WxTaskQueue1 extends BaseTaskQueue {


    public static WxTaskQueue1 getInstance() {
        return WxTaskQueue1.InnerInstance.INSTANCE;
    }

    @Override
    public void onAccessibilityEvent() {

        if (wxOptions == null) wxOptions = WxOptions.getInstance();
        wxOptions.onAccessibilityEvent(null);

        taskZan();
    }

    @Override
    public void run() {

    }

    private static class InnerInstance {
        private static final WxTaskQueue1 INSTANCE = new WxTaskQueue1();
    }

    private WxTaskQueue1() {
        Logger.e("WxTaskQueue create");
        add(Opts.OPTS_WX_TAP_FAXIAN);

        add(Opts.OPTS_WX_TAP_PENGYOUQUAN);
        add(Opts.OPTS_WX_GET_MYNAME);
        add(Opts.OPTS_WX_TAP_ZANPING);

        start();
    }


    private WxOptions wxOptions;
    private String myname;
    private int zan_count;


    private void taskZan() {
        switch (eventType) {
            case AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED: {//Notification通知变化
            }
            break;
            /////////////
            case AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED:  //窗口的内容发生变化，或子树根布局发生变化
            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED: //打开了一个PopupWindow，Menu或DiaLogger.e
//            default:
                {

                if (zan_count >= 10) {
                    stop();
                    return;
                }

                if (!StringUtils.isPackage(null, Constant.PKG_WX)) return;

                Logger.e("WxTaskQueue run");

                if (checkRunTask(Opts.OPTS_WX_TAP_FAXIAN, () -> {
                    Logger.e("WxTaskQueue tap OPTS_WX_TAP_FAXIAN");
                    wxOptions.tapWxFaXianByText();
                    return true;
                })) return;


                if (checkRunTask(Opts.OPTS_WX_TAP_PENGYOUQUAN, () -> {
                    Logger.e("WxTaskQueue tap OPTS_WX_TAP_PENGYOUQUAN");
                    wxOptions.tapWxPengYouQuan();
                    return true;
                })) return;


                if (checkRunTask(Opts.OPTS_WX_GET_MYNAME, () -> {
                    Logger.e("WxTaskQueue tap OPTS_WX_GET_MYNAME1 ", myname);
                    myname = wxOptions.getWxPengYouQuanMyName();
                    if (TextUtils.isEmpty(myname)) {
                        wxOptions.scrollWxPengYouQuanListViewBackward();
                        return false;
                    }
                    return true;
                })) return;

                checkRunTask(Opts.OPTS_WX_TAP_ZANPING, () -> {
                    List<AccessibilityNodeInfo> nds = wxOptions.getWxPengYouQuanAllItemOneScreen();

                    Logger.e("WxTaskQueue OPTS_WX_TAP_ZANPING 1");
                    //一条都没有
                    if (nds == null || nds.isEmpty()) {
                        zan_count = 999;
                        return true;
                    }


                    Logger.e("WxTaskQueue OPTS_WX_TAP_ZANPING 3");

                    for (AccessibilityNodeInfo nd : nds) {
                        boolean b = wxOptions.checkWxPengYouQuanZan(nd, myname);
                        if (b) continue;
                        if (!contains(Opts.OPTS_WX_TAP_ZAN)) {
                            Logger.e("WxTaskQueue add OPTS_WX_TAP_ZAN");
                            add(Opts.OPTS_WX_TAP_ZAN);
                        }
                        wxOptions.tapWxPengYouQuanPopZanPing(nd);
                        return true;
                    }
                    Logger.e("WxTaskQueue OPTS_WX_TAP_ZANPING 4");
                    String time = wxOptions.getWxPengYouQuanFriendTime(nds.get(nds.size() - 1));
                    //昨天以前的
                    if (time.contains("天")) {
                        zan_count = 999;
                        return true;
                    }

                    wxOptions.scrollWxPengYouQuanListViewForward();
                    Logger.e("WxTaskQueue OPTS_WX_TAP_ZANPING 5");
                    return false;
                });


                checkRunTask(Opts.OPTS_WX_TAP_ZAN, () -> {
                    Logger.e("WxTaskQueue OPTS_WX_TAP_ZAN 1");

                    //手动添加任务链 让人物能够循环
                    if (!contains(Opts.OPTS_WX_TAP_ZANPING)) {
                        Logger.e("WxTaskQueue add OPTS_WX_TAP_ZANPING");
                        add(Opts.OPTS_WX_TAP_ZANPING);
                    }

                    boolean b = wxOptions.tapWxPengYouQuanZan();
                    if (b) zan_count++;



                    return true;
                });
            }
            break;

        }
    }

}
