package com.pbph.autoclick.service;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.Service;
import android.app.usage.UsageStats;
import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.text.TextUtils;
import android.widget.Toast;

import java.io.OutputStream;
import java.util.List;

//  sendevent 也可实现类似功能
public class AutoService extends Service {

    private boolean start = true;

    /**
     * 模拟点击的ADB命令
     */
    private static final String ADB_SHELL = "input tap 668 581 \n";
    /**
     * 目标包名
     */
    private static final String PACKAGE_NAME = "com.meizu.media.music";

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onCreate() {
        super.onCreate();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        autoClick();
        return super.onStartCommand(intent, flags, startId);
    }

    /**
     * 服务销毁时的回调
     */
    @Override
    public void onDestroy() {
        start = false;
        super.onDestroy();
    }

    private void autoClick() {
        new Thread(() -> {
            while (start) {
                try {
                    Thread.sleep(3 * 1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (isCurrentAppIsTarget()) {
                    exec(ADB_SHELL);
                }
//					 1.利用ProcessBuilder执行shell命令，不能后台
//					int x = 0, y = 0;
//					String[] order = { "input", "tap", " ", x + "", y + "" };
//					try {
//						new ProcessBuilder(order).start();
//					} catch (IOException e) {
//						Log.i("GK", e.getMessage());
//						e.printStackTrace();
//					}

                // 2.可以不用在 Activity 中增加任何处理，各 Activity 都可以响应，不能后台
//					try {
//						Instrumentation inst = new Instrumentation();
//						inst.sendPointerSync(MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), MotionEvent.ACTION_DOWN, x, y, 0));
//						inst.sendPointerSync(MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), MotionEvent.ACTION_UP, x, y, 0));
//						Log.i("GK", "模拟点击" + x + ", " + y);
//					} catch (Exception e) {
//						Log.e("Exception when sendPointerSync", e.toString());
//					}

            }
        }).start();
    }

    /**
     * 如果前台APP是目标apk
     */
    private boolean isCurrentAppIsTarget() {
        if (true) return true;
        String name;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP)
            name = getForegroundAppPackageName();
        else
            name = getForegroundApp();

        return !TextUtils.isEmpty(name) && PACKAGE_NAME.equalsIgnoreCase(name);
    }

    /**
     * 获取前台程序包名，该方法在android L之前有效
     */
    public String getForegroundAppPackageName() {
        ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
        List<RunningAppProcessInfo> lr = am.getRunningAppProcesses();
        if (lr == null) {
            return null;
        }

        for (RunningAppProcessInfo ra : lr) {
            if (ra.importance == RunningAppProcessInfo.IMPORTANCE_VISIBLE || ra.importance == RunningAppProcessInfo.IMPORTANCE_FOREGROUND) {
                return ra.processName;
            }
        }
        return "";
    }


    @SuppressLint("NewApi")
    private String getForegroundApp() {
        UsageStatsManager usageStatsManager = (UsageStatsManager) getSystemService(USAGE_STATS_SERVICE);
        //获取一个月内的信息
        long ts = System.currentTimeMillis();
        List<UsageStats> queryUsageStats = usageStatsManager.queryUsageStats(UsageStatsManager.INTERVAL_BEST, ts - 2000, ts);


        if (queryUsageStats == null || queryUsageStats.isEmpty()) {
            return null;
        }

        UsageStats recentStats = null;
        for (UsageStats usageStats : queryUsageStats) {
            if (recentStats == null || recentStats.getLastTimeUsed() < usageStats.getLastTimeUsed()) {
                recentStats = usageStats;
            }
        }

        return recentStats.getPackageName();
    }

    //
    //    //在IO流中输入命令，需要加"\n"，因为见到回车才会执行命令；
////如果直接用Runtime.getRuntime().exec(adbCommand)来执行，则不必加回车符；
//
//    //点击屏幕上的一点，eg：这点的像素坐标是（100,100）
//    public String AdbTap = "input tap 100 100\n";
//    /**
//     * 实现滑动操作，前两个参数是开始坐标，接下来两个是终点坐标，最后一个是持续时间。
//     * 解释参考：http://blog.csdn.net/u012912435/article/details/51483309
//     * 可以用来模拟长按，原理：在小的距离内，在较长的持续时间内进行滑动，最后表现出来的结果就是长按动作。
//     */
//    public String AdbSwipe = "input swipe 500 500 501 501 2000\n";
//    //按下按键，eg：该按键的按键值是4（系统的返回键）。按键值参考https://www.cnblogs.com/sharecenter/p/5621048.html
//    public String AdbKeyevent = "input keyevent 4\n";
//    //输入文本，eg：文本内容是1234567890
//    public String AdbText = "input text 1234567890\n";
    public final void exec(String cmd) {
        try {
            OutputStream os = Runtime.getRuntime().exec("su").getOutputStream();

            os.write(cmd.getBytes());
            os.flush();
            os.close();
            Toast.makeText(AutoService.this, cmd, Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
