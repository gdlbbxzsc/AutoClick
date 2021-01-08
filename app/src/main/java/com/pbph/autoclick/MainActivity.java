package com.pbph.autoclick;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import com.pbph.autoclick.activity.optionslist.OptionsListActivity;
import com.pbph.autoclick.service.AutoClickAccessibilityService;
import com.pbph.autoclick.service.AutoService;
import com.pbph.autoclick.uitils.AccessibilityServiceUtils;

public class MainActivity extends Activity {
    Context context = this;

    TextView tv_btn;

    boolean isStart = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        setContentView(R.layout.activity_main);

        tv_btn = findViewById(R.id.tv_btn);


        tv_btn.setOnClickListener(v -> {
            if (true) {
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

        findViewById(R.id.setting).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AccessibilityServiceUtils.goSetting2Open(context);
            }
        });
        findViewById(R.id.check).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean b;
                b = AccessibilityServiceUtils.enabled1(context);
                Log.e("===>", "=================" + b);
                b = AccessibilityServiceUtils.enabled2(context, AutoClickAccessibilityService.class.getSimpleName());
                Log.e("===>", "=================" + b);
                b = AccessibilityServiceUtils.enabled3(context, AutoClickAccessibilityService.class.getSimpleName());
                Log.e("===>", "=================" + b);
            }
        });
    }


//    val intent = packageManager.getLaunchIntentForPackage("com.tencent.mm")
//    startActivity(intent)
}
