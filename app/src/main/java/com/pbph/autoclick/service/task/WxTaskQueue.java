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

public class WxTaskQueue extends BaseTaskQueue {


    public static WxTaskQueue getInstance() {
        return WxTaskQueue.InnerInstance.INSTANCE;
    }


    private static class InnerInstance {
        private static final WxTaskQueue INSTANCE = new WxTaskQueue();
    }

    private WxTaskQueue() {
        Logger.e("WxTaskQueue create");
        add(Opts.OPTS_WX_TAP_FAXIAN);

        add(Opts.OPTS_WX_TAP_PENGYOUQUAN);
        add(Opts.OPTS_WX_GET_MYNAME);
        add(Opts.OPTS_WX_TAP_ZANPING);

    }


    private WxOptions wxOptions;
    private String myname;
    private int zan_count;


    @Override
    public void onAccessibilityEvent() {
        if (wxOptions == null) wxOptions = WxOptions.getInstance();
        wxOptions.onAccessibilityEvent(null);
    }

    @Override
    public void run() {
        Logger.e("run==========");
        while (true) {
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Logger.e("run==========true");
            if (zan_count >= 10) {
                stop();
                Logger.e("run==========end");
                return;
            }
            Logger.e("run==========1", 0);
            if (!StringUtils.isPackage(mPackageName, Constant.PKG_WX)) continue;

            Logger.e("run==========2");
            if (checkRunTask(Opts.OPTS_WX_TAP_FAXIAN, () -> {
                wxOptions.tapWxFaXianByText();
                return true;
            })) continue;

            Logger.e("run==========3");
            if (checkRunTask(Opts.OPTS_WX_TAP_PENGYOUQUAN, () -> {
                wxOptions.tapWxPengYouQuan();
                return true;
            })) continue;

            Logger.e("run==========4");
            if (checkRunTask(Opts.OPTS_WX_GET_MYNAME, () -> {
                myname = wxOptions.getWxPengYouQuanMyName();
                if (TextUtils.isEmpty(myname)) {
                    wxOptions.scrollWxPengYouQuanListViewBackward();
                    return false;
                }
                return true;
            })) continue;

            if (checkRunTask(Opts.OPTS_WX_TAP_ZANPING, () -> {
                List<AccessibilityNodeInfo> nds = wxOptions.getWxPengYouQuanAllItemOneScreen();

                //一条都没有
                if (nds == null || nds.isEmpty()) {
                    zan_count = 999;
                    return true;
                }

                for (AccessibilityNodeInfo nd : nds) {
                    boolean b = wxOptions.checkWxPengYouQuanZan(nd, myname);
                    if (b) continue;
                    if (!contains(Opts.OPTS_WX_TAP_ZAN)) {
                        Logger.e("WxTaskQueue add OPTS_WX_TAP_ZAN");
                        add(Opts.OPTS_WX_TAP_ZAN);
                    }
                    wxOptions.tapWxPengYouQuanPopZanPing(nd);
                    //手动添加任务链 让人物能够循环
                    if (!contains(Opts.OPTS_WX_TAP_ZANPING)) {
                        Logger.e("WxTaskQueue add OPTS_WX_TAP_ZANPING");
                        add(Opts.OPTS_WX_TAP_ZANPING);
                    }
                    b = wxOptions.tapWxPengYouQuanZan();
                    if (b) zan_count++;
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
            })) continue;

        }
    }

}
