package com.pbph.autoclick.uitils;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.Context;
import android.content.Intent;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.accessibility.AccessibilityManager;

import java.util.List;

public final class AccessibilityServiceUtils {
    //跳转到设置界面去手动开启
    public static final void goSetting2Open(Context context) {
        context.startActivity(new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS));
    }

    //判断无障碍服务是否开启
    public static final boolean enabled1(Context context) {
        AccessibilityManager am = (AccessibilityManager) context.getApplicationContext().getSystemService(Context.ACCESSIBILITY_SERVICE);
        return am.isEnabled();
    }

    //判断无障碍服务是否开启
    public static final boolean enabled2(Context context, String service_name) {

        AccessibilityManager am = (AccessibilityManager) context.getApplicationContext().getSystemService(Context.ACCESSIBILITY_SERVICE);

        List<AccessibilityServiceInfo> list = am.getEnabledAccessibilityServiceList(AccessibilityServiceInfo.FEEDBACK_GENERIC);//已允许
//        List<AccessibilityServiceInfo> list = am.getInstalledAccessibilityServiceList();//全部
        for (AccessibilityServiceInfo info : list) {
            String info_id = info.getId();
            if (!info_id.contains(context.getPackageName())) continue;
            if (!info_id.contains(service_name)) continue;
            return true;
        }
        return false;
    }


    //判断无障碍服务是否开启 高版本的时候试一下
    public static final boolean enabled3(Context context, String service_name) {
        try {
            int ok = Settings.Secure.getInt(context.getApplicationContext().getContentResolver(), Settings.Secure.ACCESSIBILITY_ENABLED);

            if (ok != 1) return false;

            String settingValue = Settings.Secure.getString(context.getApplicationContext().getContentResolver(), Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES);
            if (settingValue == null) return false;

            TextUtils.SimpleStringSplitter ms = new TextUtils.SimpleStringSplitter(':');
            ms.setString(settingValue);

            while (ms.hasNext()) {
                String accessibilityService = ms.next();
                if (accessibilityService.equalsIgnoreCase(service_name)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
