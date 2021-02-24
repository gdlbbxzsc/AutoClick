package com.pbph.autoclick.service;

import android.view.accessibility.AccessibilityNodeInfo;

import java.util.ArrayList;
import java.util.List;

public final class AccessibilityServiceFindUtils1 {

    //查找第一个匹配的控件
    public static AccessibilityNodeInfo findFirst(AccessibilityNodeInfo rootInfo, AbstractTF... tfs) {
        if (tfs == null || tfs.length == 0) return null;

        if (rootInfo == null) return null;

        int idTextIndex = -1;
        for (int i = 0; i < tfs.length; i++) {
            if ((tfs[i] instanceof AbstractTF.IdTF) || (tfs[i] instanceof AbstractTF.TextTF)) {
                idTextIndex = i;
                break;
            }
        }

        AccessibilityNodeInfo returnInfo = null;

        if (idTextIndex == -1) {
            returnInfo = findFirstRecursive(rootInfo, tfs);
        } else {
            List<AccessibilityNodeInfo> list = null;
            if ((tfs[idTextIndex] instanceof AbstractTF.IdTF)) {
                AbstractTF.IdTF idTF = (AbstractTF.IdTF) tfs[idTextIndex];
                list = rootInfo.findAccessibilityNodeInfosByViewId(idTF.mCheckData);
            }

            if ((tfs[idTextIndex] instanceof AbstractTF.TextTF)) {
                AbstractTF.TextTF idTF = (AbstractTF.TextTF) tfs[idTextIndex];
                list = rootInfo.findAccessibilityNodeInfosByText(idTF.mCheckData);
            }

            if (list != null && !list.isEmpty()) {

                for (int i = 0; i < list.size(); i++) {
                    AccessibilityNodeInfo temp = list.get(i);
                    if (returnInfo != null) {//其他的均回收
//                        temp.recycle();
                        continue;
                    }
                    returnInfo = temp;
                }
            }
        }

//        rootInfo.recycle();
        return returnInfo;
    }


    public static AccessibilityNodeInfo findFirstRecursive(AccessibilityNodeInfo
                                                                   parent, AbstractTF... tfs) {
        if (parent == null || tfs.length == 0) return null;

        for (int i = 0; i < parent.getChildCount(); i++) {
            AccessibilityNodeInfo child = parent.getChild(i);
            if (child == null) continue;

            for (AbstractTF tf : tfs) {
                if (tf.checkOk(child)) return child;
            }

            AccessibilityNodeInfo childChild = findFirstRecursive(child, tfs);

//            child.recycle();

            if (childChild == null) continue;

            return childChild;
        }
        return null;
    }

    //查找全部匹配的控件
    public static List<AccessibilityNodeInfo> findAll(AccessibilityNodeInfo rootInfo, AbstractTF... tfs) {
        if (tfs.length == 0) return null;


        ArrayList<AccessibilityNodeInfo> returnList = new ArrayList<>();

        if (rootInfo == null) return returnList;


        int idTextIndex = -1;
        for (int i = 0; i < tfs.length; i++) {
            if ((tfs[i] instanceof AbstractTF.IdTF) || (tfs[i] instanceof AbstractTF.TextTF)) {
                idTextIndex = i;
                break;
            }
        }

        if (idTextIndex == -1) {
            returnList.addAll(findAllRecursive(rootInfo, tfs));
        } else {
            List<AccessibilityNodeInfo> list = null;
            if ((tfs[idTextIndex] instanceof AbstractTF.IdTF)) {
                AbstractTF.IdTF idTF = (AbstractTF.IdTF) tfs[idTextIndex];
                list = rootInfo.findAccessibilityNodeInfosByViewId(idTF.mCheckData);
            }

            if ((tfs[idTextIndex] instanceof AbstractTF.TextTF)) {
                AbstractTF.TextTF idTF = (AbstractTF.TextTF) tfs[idTextIndex];
                list = rootInfo.findAccessibilityNodeInfosByText(idTF.mCheckData);
            }
            if (list != null && !list.isEmpty()) {
                if (tfs.length == 1) {
                    returnList.addAll(list);
                } else {
                    for (int i = 0; i < list.size(); i++) {
                        AccessibilityNodeInfo info = list.get(i);

                        boolean isOk = true;
                        for (AbstractTF tf : tfs) {
                            if (tf.checkOk(info)) continue;

                            isOk = false;
                            break;
                        }

                        if (isOk) {
                            list.add(info);
                        } else {
//                            info.recycle();
                        }
                    }
                }
            }
        }

//        rootInfo.recycle();
        return returnList;
    }


    public static List<AccessibilityNodeInfo> findAllRecursive(AccessibilityNodeInfo parent, AbstractTF... tfs) {

        ArrayList<AccessibilityNodeInfo> returnList = new ArrayList<>();
        if (parent == null || tfs.length == 0) return returnList;


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
                returnList.add(child);
            } else {
                returnList.addAll(findAllRecursive(child, tfs));
//                child.recycle();
            }
        }
        return returnList;
    }
}
