package com.pbph.autoclick;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AppOpsManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.TextView;

import com.pbph.autoclick.activity.optionslist.OptionsListActivity;
import com.pbph.autoclick.service.AutoService;

import java.util.List;

public class MainActivity extends Activity {
    Context context=this;
    TextView tv_xy;
    TextView tv_btn;

    boolean isStart = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        checkUsagePermission();

        setContentView(R.layout.activity_main);
        tv_xy = findViewById(R.id.tv_xy);
        tv_btn = findViewById(R.id.tv_btn);


        tv_btn.setOnClickListener(v -> {
            if (true){
                startActivity(new Intent(context, OptionsListActivity.class));
                return;
            }
            if (isStart) {


                stopService(new Intent(MainActivity.this, AutoService.class));
                tv_btn.setText("开启服务");
                isStart = false;
            } else {
                startService(new Intent(MainActivity.this, AutoService.class));
                tv_btn.setText("关闭服务");
                isStart = true;
            }
        });
    }







    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int x = (int) event.getX();
        int y = (int) event.getY();
        tv_xy.setText("X:" + x + " Y:" + y);
        return true;
    }


    @TargetApi(Build.VERSION_CODES.M)
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != 1) return;

        AppOpsManager appOps = (AppOpsManager) getSystemService(Context.APP_OPS_SERVICE);
        int mode = 0;
        mode = appOps.checkOpNoThrow("android:get_usage_stats", android.os.Process.myUid(), getPackageName());
        boolean granted = mode == AppOpsManager.MODE_ALLOWED;
        if (!granted) {
//            Toast.makeText(this, "请开启该权限", Toast.LENGTH_SHORT).show();
        }

    }

    private boolean checkUsagePermission() {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT) {
            AppOpsManager appOps = (AppOpsManager) getSystemService(Context.APP_OPS_SERVICE);
            int mode = 0;
            mode = appOps.checkOpNoThrow("android:get_usage_stats", android.os.Process.myUid(), getPackageName());
            boolean granted = mode == AppOpsManager.MODE_ALLOWED;
            if (!granted) {
                Intent intent = new Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS);
                startActivityForResult(intent, 1);
                return false;
            }
        }
        return true;
    }

    //判断无障碍服务是否开启
    private boolean enabled(String name) {
        AccessibilityManager am = (AccessibilityManager) getSystemService(Context.ACCESSIBILITY_SERVICE);
        List<AccessibilityServiceInfo> serviceInfos = am.getEnabledAccessibilityServiceList(AccessibilityServiceInfo.FEEDBACK_GENERIC);
        List<AccessibilityServiceInfo> installedAccessibilityServiceList = am.getInstalledAccessibilityServiceList();
        for (AccessibilityServiceInfo info : installedAccessibilityServiceList) {
            if (name.equals(info.getId())) {
                return true;
            }
        }
        return false;
    }

    //判断无障碍服务是否开启
    private boolean enabled1(String service) {
        try {
            int ok = Settings.Secure.getInt(getApplicationContext().getContentResolver(), Settings.Secure.ACCESSIBILITY_ENABLED);

            if (ok != 1) return false;

            String settingValue = Settings.Secure.getString(getApplicationContext().getContentResolver(), Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES);
            if (settingValue == null) return false;

            TextUtils.SimpleStringSplitter ms = new TextUtils.SimpleStringSplitter(':');
            ms.setString(settingValue);

            while (ms.hasNext()) {
                String accessibilityService = ms.next();
                if (accessibilityService.equalsIgnoreCase(service)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
//    val intent = packageManager.getLaunchIntentForPackage("com.tencent.mm")
//    startActivity(intent)
//    startActivity(Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS))
}
