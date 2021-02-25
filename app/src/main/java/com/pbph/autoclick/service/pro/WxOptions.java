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


    public boolean tapWxFaXianById() {
        List<AccessibilityNodeInfo> bottomBtns = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_MAIN_BOTTOM_TAB_TV));

        if (bottomBtns == null || bottomBtns.size() <= 0) return false;

        return AccessibilityServiceEventUtils.clickOrParent(bottomBtns.get(2));
    }

    public boolean tapWxFaXianByText() {
        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newText("发现", true));

        if (nds == null || nds.size() <= 0) return false;
        boolean b;
        for (AccessibilityNodeInfo fx : nds) {
            b = AccessibilityServiceEventUtils.clickOrParent(fx);
            if (b) return true;
        }
        return false;
    }

    public boolean tapWxPengYouQuan() {


        AccessibilityNodeInfo nd = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newText("朋友圈", true));

        if (nd == null) return false;

        return AccessibilityServiceEventUtils.clickOrParent(nd);
    }

    public AccessibilityNodeInfo getWxPengYouQuanListViewById() {


        return AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_LV));
    }

    public AccessibilityNodeInfo getWxPengYouQuanListViewByClz() {

        return AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newClassName(AbstractTF.ST_LISTVIEW, true));
    }

    public void scrollWxPengYouQuanListViewForward() {
        AccessibilityNodeInfo nd = getWxPengYouQuanListViewByClz();
        nd.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);
    }

    public void scrollWxPengYouQuanListViewBackward() {
        AccessibilityNodeInfo nd = getWxPengYouQuanListViewByClz();
        nd.performAction(AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD);
    }

    public String getWxPengYouQuanMyName() {
        AccessibilityNodeInfo nd = AccessibilityServiceFindUtils.findFirst(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_HEADVIEW_RL));
        if (nd == null) return null;
        AccessibilityNodeInfo myNameNd = AccessibilityServiceFindUtils.findFirst(nd, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_TOP_MYNAME_TV));

        if (myNameNd == null) return null;
        return myNameNd.getText().toString();
    }

    public String getWxPengYouQuanFriendName(AccessibilityNodeInfo nd) {
        AccessibilityNodeInfo myNameNd = AccessibilityServiceFindUtils.findFirst(nd, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_TOP_MYNAME_TV));
        if (myNameNd == null) return "";
        return myNameNd.getText().toString();
    }

    public String getWxPengYouQuanFriendTime(AccessibilityNodeInfo nd) {
        AccessibilityNodeInfo myNameNd = AccessibilityServiceFindUtils.findFirst(nd, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_TIME_IV));
        if (myNameNd == null) return "";
        return myNameNd.getText().toString();
    }


    public List<AccessibilityNodeInfo> getWxPengYouQuanAllItemOneScreen() {
        return AccessibilityServiceFindUtils.findAll(service.getRootInActiveWindow(), AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_RL));
    }

    public boolean checkWxPengYouQuanZan(AccessibilityNodeInfo root, String myname) {
        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(root, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_ZANNAMES_TV));

        if (nds == null || nds.size() <= 0) return false;
        String names = nds.get(0).getText().toString().trim();
        return names.contains(myname);
    }

    public boolean tapWxPengYouQuanPopZanPing(AccessibilityNodeInfo root) {
        List<AccessibilityNodeInfo> nds = AccessibilityServiceFindUtils.findAll(root, AbstractTF.newId(Ids.Wx.ID_PAGE_PENGYOUQUAN_ITEM_POPZANPING_IV));
        if (nds == null || nds.size() <= 0) return false;

        return AccessibilityServiceEventUtils.clickOrParent(nds.get(0));
    }

    public boolean tapWxPengYouQuanZan() {
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
