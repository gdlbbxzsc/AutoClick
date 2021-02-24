package com.pbph.autoclick.service.pro;

import android.app.Notification;
import android.app.PendingIntent;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Toast;

import com.pbph.autoclick.Constant;
import com.pbph.autoclick.Ids;
import com.pbph.autoclick.service.AbstractTF;
import com.pbph.autoclick.service.AccessibilityServiceEventUtils;
import com.pbph.autoclick.service.AccessibilityServiceFindUtils;
import com.pbph.autoclick.service.BaseOptions;
import com.pbph.autoclick.uitils.StringUtils;

import java.util.List;

public final class WxOptions extends BaseOptions {


    public static WxOptions getInstance() {
        return InnerInstance.INSTANCE;
    }

    private static class InnerInstance {
        private static final WxOptions INSTANCE = new WxOptions();
    }

    private WxOptions() {
    }


    public void onAccessibilityEvent() {
        switch (eventType) {
            case AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED:  //窗口的内容发生变化，或子树根布局发生变化
            case AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED: {//打开了一个PopupWindow，Menu或Dialog
                goWxFaXianByText( );
                goWxPengYouQuan( );
//                scrollWxPengYouQuanListViewBackward();
                getWxPengYouQuanAllItem2Zan();
            }
            break;
            case AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED: {//Notification通知变化
                openWxHongBao();
            }
            break;
        }
    }

    public boolean goWxFaXianById() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;

        List<AccessibilityNodeInfo> bottomBtns = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_MAIN_BOTTOM_TAB_TV));

        if (bottomBtns == null || bottomBtns.size() <= 0) return false;

        return AccessibilityServiceEventUtils.clickOrParent(bottomBtns.get(2));
    }

    public boolean goWxFaXianByText() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;

        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newText("发现", true));

        if (nds == null || nds.size() <= 0) return false;
        boolean b;
        for (AccessibilityNodeInfo fx : nds) {
            b = AccessibilityServiceEventUtils.clickOrParent(fx);
            if (b) return true;
        }
        return false;
    }

    public boolean goWxPengYouQuan() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;

        AccessibilityNodeInfo nd = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newText("朋友圈", true));

        if (nd == null) return false;

        return AccessibilityServiceEventUtils.clickOrParent(nd);
    }

    public AccessibilityNodeInfo getWxPengYouQuanListViewById() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return null;

        return AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_LV));
    }

    public AccessibilityNodeInfo getWxPengYouQuanListViewByClz() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return null;

        return AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newClassName(AbstractTF.ST_LISTVIEW, true));
    }

    public void scrollWxPengYouQuanListViewForward() {
        AccessibilityServiceEventUtils.sleep(300);
        AccessibilityNodeInfo nd = getWxPengYouQuanListViewByClz();
        nd.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);
    }

    public void scrollWxPengYouQuanListViewBackward() {
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        AccessibilityNodeInfo nd = getWxPengYouQuanListViewByClz();
        nd.performAction(AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD);
    }

    public String getWxPengYouQuanMyName() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return null;
        AccessibilityNodeInfo nd = null;
        while (nd == null) {
            scrollWxPengYouQuanListViewBackward();
            nd = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_HEADVIEW_RL));
        }

        AccessibilityNodeInfo myNameNd = AccessibilityServiceFindUtils.findFirst(nd, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_TOP_MYNAME_TV));

        if (myNameNd == null) return null;
        // if (nd.getParent().getChildCount() <= 1) return null;
        Toast.makeText(service.getApplicationContext(), "my name is :" + myNameNd.getText().toString(), Toast.LENGTH_SHORT).show();
        return myNameNd.getText().toString();
    }

    public boolean getWxPengYouQuanAllItem2Zan() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;

        String myname = getWxPengYouQuanMyName();

        int count = 0;
        while (count < 10) {
            List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_RL));

            if (nds == null || nds.size() <= 0) return false;

            for (AccessibilityNodeInfo nd : nds) {
                checkWxPengYouQuanZan(nd, myname);
            }

            scrollWxPengYouQuanListViewForward();

            count += nds.size();
        }

        return true;
    }


    public boolean checkWxPengYouQuanZan(AccessibilityNodeInfo root, String myname) {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;

        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(root, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_ZANNAMES_TV));

        if (nds == null || nds.size() <= 0) return false;
        String names = nds.get(0).getText().toString().trim();
        if (names.contains(myname)) return true;
        return tapWxPengYouQuanPopZanPing(root);
    }

    public boolean tapWxPengYouQuanPopZanPing(AccessibilityNodeInfo root) {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;

        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(root, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_POPZANPING_IV));
        if (nds == null || nds.size() <= 0) return false;

        boolean b = AccessibilityServiceEventUtils.clickOrParent(nds.get(0));
        if (!b) return false;

        b = tapWxPengYouQuanZan();
        return b;
    }

    public boolean tapWxPengYouQuanZan() {
        if (!StringUtils.isPackage(event, Constant.PKG_WX)) return false;
        AccessibilityServiceEventUtils.sleep(300);

        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_ZAN_TV));

        if (nds == null || nds.size() <= 0) return false;

        return AccessibilityServiceEventUtils.clickOrParent(nds.get(0));
    }

    public boolean openWxHongBao() {
        try {
            Parcelable parcelable = event.getParcelableData();
            if (parcelable == null) return false;

            if (!(parcelable instanceof Notification)) return false;

            Notification notification = (Notification) parcelable;

            String content = notification.tickerText.toString();

            if (!(content.contains("[微信红包]"))) return false;

            PendingIntent pendingIntent = notification.contentIntent;

            pendingIntent.send();
            return true;
        } catch (PendingIntent.CanceledException e) {
            e.printStackTrace();
            return false;
        }
    }

}
