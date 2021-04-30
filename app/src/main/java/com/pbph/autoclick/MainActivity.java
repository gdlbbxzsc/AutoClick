package com.pbph.autoclick;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import androidx.core.app.ActivityCompat;

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


        final TextView tv_btn_run_time = findViewById(R.id.tv_btn_run_time);
        tv_btn_run_time.setOnClickListener(v -> {
            if (Myapplication.time == 5)
                Myapplication.time = 37;

            else
                Myapplication.time = 5;
            tv_btn_run_time.setText("间隔" + Myapplication.time + "秒");
        });
        final TextView tv_btn_run = findViewById(R.id.tv_btn_run);
        tv_btn_run.setOnClickListener(v -> {
            if (Myapplication.isRun) {
                Myapplication.isRun = false;
                tv_btn_run.setText("运行中");
            } else {
                Myapplication.isRun = true;
                tv_btn_run.setText("停止");
            }
        });


        final DisplayMetrics displayMetrics = getResources().getDisplayMetrics();


//        //屏幕横滑手势
//        Path path = new Path();
//        path.moveTo(displayMetrics.widthPixels / 2, displayMetrics.heightPixels * 2 / 3);//从屏幕的2/3处开始滑动
//        path.lineTo(10, displayMetrics.heightPixels * 2 / 3);
//        final GestureDescription.StrokeDescription sd = new GestureDescription.StrokeDescription(path, 0, 500);
//        HongBaoService.mService.dispatchGesture(new GestureDescription.Builder().addStroke(sd).build(), new AccessibilityService.GestureResultCallback() {
//            @Override
//            public void onCompleted(GestureDescription gestureDescription) {
//                super.onCompleted(gestureDescription);
//                Toast.makeText(MainActivity.this, "手势成功", Toast.LENGTH_SHORT).show();
//            }
//
//            @Override
//            public void onCancelled(GestureDescription gestureDescription) {
//                super.onCancelled(gestureDescription);
//                Toast.makeText(MainActivity.this, "手势失败，请重启手机再试", Toast.LENGTH_SHORT).show();
//            }
//        }, null);


//        //用手势长按指定控件
//        AccessibilityNodeInfo ces = HongBaoService.mService.findFirst(AbstractTF.newText("测试控件", true));
//        if (ces == null) {
//            Utils.toast("找测试控件失败");
//            return;
//        }
//        //这里为了示范手势的效果
//        Rect absXY = new Rect();
//        ces.getBoundsInScreen(absXY);
////                HongBaoService.mService.dispatchGestureClick(absXY.left + (absXY.right - absXY.left) / 2, absXY.top + (absXY.bottom - absXY.top) / 2);//手势点击效果
//        //手势长按效果
//        //控件正中间
//        HongBaoService.mService.dispatchGestureLongClick(absXY.left + (absXY.right - absXY.left) / 2, absXY.top + (absXY.bottom - absXY.top) / 2);


//        //用系统的返回效果
//        HongBaoService.mService.performGlobalAction(AccessibilityService.GLOBAL_ACTION_BACK);


        //    val intent = packageManager.getLaunchIntentForPackage("com.tencent.mm")
//    startActivity(intent)

        verifyStoragePermissions();

    }

    private static final int REQUEST_EXTERNAL_STORAGE = 1;

    private static String[] PERMISSIONS_STORAGE = {
            "android.permission.READ_EXTERNAL_STORAGE",
            "android.permission.WRITE_EXTERNAL_STORAGE"};

    public void verifyStoragePermissions() {
        try {
            //检测是否有写的权限
            int permission = ActivityCompat.checkSelfPermission(this,
                    "android.permission.WRITE_EXTERNAL_STORAGE");
            if (permission != PackageManager.PERMISSION_GRANTED) {
                // 没有写的权限，去申请写的权限，会弹出对话框
                ActivityCompat.requestPermissions(this, PERMISSIONS_STORAGE, REQUEST_EXTERNAL_STORAGE);
                System.out.println("here1 ");
            } else {
                System.out.println("here2 ");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
