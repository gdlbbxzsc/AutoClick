package com.pbph.autoclick.service;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.text.TextUtils;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import androidx.annotation.RequiresApi;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;

//https://blog.csdn.net/siyujiework/article/details/88996145 root权限下 自动授权无障碍
https://www.jianshu.com/p/4cd8c109cdfb 参考
public class AutoClickAccessibilityService extends AccessibilityService {

    @Override
    public void onInterrupt() {
    }

    //初始化
    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
    }

    //实现辅助功能
    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        int eventType = event.getEventType();
        switch (eventType) {
            case AccessibilityEvent.TYPE_VIEW_CLICKED:
                //界面点击
                break;
            case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED:
                //界面文字改动
                break;
        }
    }



    //////////////////////////////////////////////////////////////////////////////////////////////

    //    点击该控件 true表示点击成功
    public static boolean click(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isClickable()) return false;
        nodeInfo.performAction(AccessibilityNodeInfo.ACTION_CLICK);
        nodeInfo.recycle();
        return true;
    }

    //    点击该控件 true表示点击成功如果当前控件不可点击 查找其父类控件进行点击
    public static boolean clickOrParent(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isClickable()) return clickOrParent(nodeInfo.getParent());
        nodeInfo.performAction(AccessibilityNodeInfo.ACTION_CLICK);
        nodeInfo.recycle();
        return true;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public void click7(AccessibilityNodeInfo nodeInfo) {
        Rect absXY = new Rect();
        nodeInfo.getBoundsInScreen(absXY);
        click7(getCenter(absXY));
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public void click7(Point point) {
        click7(point.x, point.y);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public void click7(int x, int y) {
        Path path = new Path();
        path.moveTo(x - 1, y - 1);
        path.lineTo(x + 1, y + 1);
        dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription
                (path, 0, 100)).build(), null, null);
    }

    public static boolean longClick(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isLongClickable()) return false;
        nodeInfo.performAction(AccessibilityNodeInfo.ACTION_LONG_CLICK);
        nodeInfo.recycle();
        return true;
    }

    public static boolean longClickOrParent(AccessibilityNodeInfo nodeInfo) {
        if (nodeInfo == null) return false;
        if (!nodeInfo.isLongClickable()) return longClickOrParent(nodeInfo.getParent());
        nodeInfo.performAction(AccessibilityNodeInfo.ACTION_LONG_CLICK);
        nodeInfo.recycle();
        return true;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public void longClick7(AccessibilityNodeInfo nodeInfo) {
        Rect absXY = new Rect();
        nodeInfo.getBoundsInScreen(absXY);
        longClick7(getCenter(absXY));
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public void longClick7(Point point) {
        longClick7(point.x, point.y);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    public void longClick7(int x, int y) {
        Path path = new Path();
        path.moveTo(x - 1, y - 1);
        path.lineTo(x, y - 1);
        path.lineTo(x, y);
        path.lineTo(x - 1, y);
        dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription
                (path, 0, 1000)).build(), null, null);
    }


    @RequiresApi(api = Build.VERSION_CODES.N)
    public void move7(Path path, long mills) {
        dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription
                (path, 0, mills)).build(), null, null);
    }

    //////////////////////////////////////////////////////////////////////////////////////////////


    /**
     * 查找第一个匹配的控件
     *
     * @param tfs 匹配条件，多个AbstractTF是&&的关系，如：
     *            AbstractTF.newContentDescription("表情", true),AbstractTF.newClassName(AbstractTF.ST_IMAGEVIEW)
     *            表示描述内容是'表情'并且是imageview的控件
     */

    public AccessibilityNodeInfo findFirst(AbstractTF... tfs) {
        if (tfs.length == 0) throw new InvalidParameterException("AbstractTF不允许传空");

        AccessibilityNodeInfo rootInfo = getRootInActiveWindow();
        if (rootInfo == null) return null;

        int idTextTFCount = 0, idTextIndex = 0;
        for (int i = 0; i < tfs.length; i++) {
            if (tfs[i] instanceof AbstractTF.IdTextTF) {
                idTextTFCount++;
                idTextIndex = i;
            }
        }
        switch (idTextTFCount) {
            case 0://id或text数量为0，直接循环查找
                AccessibilityNodeInfo returnInfo = findFirstRecursive(rootInfo, tfs);
                rootInfo.recycle();
                return returnInfo;
            case 1://id或text数量为1，先查出对应的id或text，然后再查其他条件
                if (tfs.length == 1) {
                    AccessibilityNodeInfo returnInfo2 = ((AbstractTF.IdTextTF) tfs[idTextIndex]).findFirst(rootInfo);
                    rootInfo.recycle();
                    return returnInfo2;
                } else {
                    List<AccessibilityNodeInfo> listIdText = ((AbstractTF.IdTextTF) tfs[idTextIndex]).findAll(rootInfo);
                    if (listIdText == null || listIdText.isEmpty()) {
                        break;
                    }
                    AccessibilityNodeInfo returnInfo3 = null;
                    for (AccessibilityNodeInfo info : listIdText) {//遍历找到匹配的
                        if (returnInfo3 == null) {
                            boolean isOk = true;
                            for (AbstractTF tf : tfs) {
                                if (!tf.checkOk(info)) {
                                    isOk = false;
                                    break;
                                }
                            }
                            if (isOk) {
                                returnInfo3 = info;
                            } else {
                                info.recycle();
                            }
                        } else {
                            info.recycle();
                        }
                    }
                    rootInfo.recycle();
                    return returnInfo3;
                }
        }
        rootInfo.recycle();
        return null;
    }

    public static AccessibilityNodeInfo findFirstRecursive(AccessibilityNodeInfo parent, AbstractTF... tfs) {
        if (parent == null) return null;
        if (tfs.length == 0) return null;

        for (int i = 0; i < parent.getChildCount(); i++) {
            AccessibilityNodeInfo child = parent.getChild(i);
            if (child == null) continue;
            boolean isOk = true;
            for (AbstractTF tf : tfs) {
                if (tf.checkOk(child)) continue;

                isOk = false;
                break;
            }
            if (isOk) {
                return child;
            } else {
                AccessibilityNodeInfo childChild = findFirstRecursive(child, tfs);
                child.recycle();
                if (childChild != null) {
                    return childChild;
                }
            }
        }
        return null;
    }

    /**
     * 查找全部匹配的控件
     *
     * @param tfs 匹配条件，多个AbstractTF是&&的关系，如：
     *            AbstractTF.newContentDescription("表情", true),AbstractTF.newClassName(AbstractTF.ST_IMAGEVIEW)
     *            表示描述内容是'表情'并且是imageview的控件 比如：一个按钮由一个文字一张图片组成
     */

    public List<AccessibilityNodeInfo> findAll(AbstractTF... tfs) {
        if (tfs.length == 0) return null;

        ArrayList<AccessibilityNodeInfo> list = new ArrayList<>();
        AccessibilityNodeInfo rootInfo = getRootInActiveWindow();
        if (rootInfo == null) return list;

        int idTextTFCount = 0, idTextIndex = 0;
        for (int i = 0; i < tfs.length; i++) {
            if (tfs[i] instanceof AbstractTF.IdTextTF) {
                idTextTFCount++;
                idTextIndex = i;
            }
        }
        switch (idTextTFCount) {
            case 0://id或text数量为0，直接循环查找
                findAllRecursive(list, rootInfo, tfs);
                break;
            case 1://id或text数量为1，先查出对应的id或text，然后再循环
                List<AccessibilityNodeInfo> listIdText = ((AbstractTF.IdTextTF) tfs[idTextIndex]).findAll(rootInfo);
                if (listIdText == null || listIdText.isEmpty()) {
                    break;
                }
                if (tfs.length == 1) {
                    list.addAll(listIdText);
                } else {
                    for (AccessibilityNodeInfo info : listIdText) {
                        boolean isOk = true;
                        for (AbstractTF tf : tfs) {
                            if (!tf.checkOk(info)) {
                                isOk = false;
                                break;
                            }
                        }
                        if (isOk) {
                            list.add(info);
                        } else {
                            info.recycle();
                        }
                    }
                }
                break;
            default:
                throw new RuntimeException("由于时间有限，并且多了也没什么用，所以IdTF和TextTF只能有一个");
        }
        rootInfo.recycle();
        return list;
    }


    public static void findAllRecursive(List<AccessibilityNodeInfo> list, AccessibilityNodeInfo parent, AbstractTF... tfs) {
        if (parent == null || list == null) return;

        if (tfs.length == 0) return;

        for (int i = 0; i < parent.getChildCount(); i++) {
            AccessibilityNodeInfo child = parent.getChild(i);
            if (child == null) continue;

            boolean isOk = true;

            for (AbstractTF tf : tfs) {
                if (tf.checkOk(child)) continue;
                isOk = false;
                break;
            }

            if (isOk) {
                list.add(child);
            } else {
                findAllRecursive(list, child, tfs);
                child.recycle();
            }
        }
    }

    public static Point getCenter(Rect absXY) {
        Point point = new Point();
        point.x = absXY.left + (absXY.right - absXY.left) / 2;
        point.y = absXY.top + (absXY.bottom - absXY.top) / 2;
        return point;
    }
}
