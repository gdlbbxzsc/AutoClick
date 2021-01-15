package com.pbph.autoclick.service;

import android.graphics.Rect;
import android.view.accessibility.AccessibilityNodeInfo;

public abstract class AbstractTF<T> {

    public static final String ST_VIEW = "android.view.View";
    public static final String ST_TEXTVIEW = "android.widget.TextView";
    public static final String ST_IMAGEVIEW = "android.widget.ImageView";
    public static final String ST_BUTTON = "android.widget.Button";
    public static final String ST_IMAGEBUTTON = "android.widget.ImageButton";
    public static final String ST_EDITTEXT = "android.widget.EditText";
    public static final String ST_LISTVIEW = "android.widget.ListView";
    public static final String ST_LINEARLAYOUT = "android.widget.LinearLayout";
    public static final String ST_VIEWGROUP = "android.view.ViewGroup";
    public static final String ST_SYSTEMUI = "com.android.systemui";


    public static AbstractTF newId(String pageName, String idName) {
        return newId(pageName + ":id/" + idName);
    }

    public static AbstractTF newId(String idfullName) {
        return new IdTF(idfullName);
    }

    public static AbstractTF newText(String text, boolean isEquals) {
        return new TextTF(text, isEquals);
    }

    public static AbstractTF newWebText(String webText, boolean isEquals) {
        return new WebTextTF(webText, isEquals);
    }

    public static AbstractTF newContentDescription(String cd, boolean isEquals) {
        return new ContentDescriptionTF(cd, isEquals);
    }

    public static AbstractTF newClassName(String className) {
        return new ClassNameTF(className, true);
    }

    public static AbstractTF newClassName(String className, boolean isEquals) {
        return new ClassNameTF(className, isEquals);
    }

    public static AbstractTF newRect(Rect rect) {
        return new RectTF(rect);
    }


    protected final boolean mIsEquals;//是包含还必须相等;
    protected final T mCheckData;

    private AbstractTF(T checkData, boolean isEquals) {
        mCheckData = checkData;
        mIsEquals = isEquals;
    }

    public abstract boolean checkOk(AccessibilityNodeInfo thisInfo);

    //通过id找控件
    static class IdTF extends AbstractTF<String> {
        private IdTF(String idFullName) {
            super(idFullName, true);
        }

        @Override
        public boolean checkOk(AccessibilityNodeInfo thisInfo) {
            return true;
        }
    }

    //通过文字
    static class TextTF extends AbstractTF<String> {
        private TextTF(String text, boolean isEquals) {
            super(text, isEquals);
        }

        @Override
        public boolean checkOk(AccessibilityNodeInfo thisInfo) {
            CharSequence text = thisInfo.getText();
            if (text == null) return false;
            String str = text.toString();
            return mIsEquals ? str.equals(mCheckData) : str.contains(mCheckData);
        }
    }

    //类似uc浏览器，有text值但无法直接根据text来找到
    static class WebTextTF extends AbstractTF<String> {
        private WebTextTF(String checkString, boolean isEquals) {
            super(checkString, isEquals);
        }

        @Override
        public boolean checkOk(AccessibilityNodeInfo thisInfo) {
            CharSequence text = thisInfo.getText();
            if (text == null) return false;
            String str = text.toString();
            return mIsEquals ? str.equals(mCheckData) : str.contains(mCheckData);
        }
    }

    //ContentDescription字段
    static class ContentDescriptionTF extends AbstractTF<String> {
        private ContentDescriptionTF(String checkString, boolean isEquals) {
            super(checkString, isEquals);
        }

        @Override
        public boolean checkOk(AccessibilityNodeInfo thisInfo) {
            CharSequence text = thisInfo.getContentDescription();
            if (text == null) return false;
            String str = text.toString();
            return mIsEquals ? str.equals(mCheckData) : str.contains(mCheckData);
        }
    }

    //ClassName匹配
    static class ClassNameTF extends AbstractTF<String> {
        public ClassNameTF(String checkString, boolean isEquals) {
            super(checkString, isEquals);
        }

        @Override
        public boolean checkOk(AccessibilityNodeInfo thisInfo) {
            String str = thisInfo.getClassName().toString();
            return mIsEquals ? str.equals(mCheckData) : str.contains(mCheckData);
        }
    }

    //区域内的控件
    static class RectTF extends AbstractTF<Rect> {

        private static Rect mRecycleRect = new Rect();

        public RectTF(Rect rect) {
            super(rect, true);
        }

        @Override
        public boolean checkOk(AccessibilityNodeInfo thisInfo) {
            thisInfo.getBoundsInScreen(mRecycleRect);
            return mCheckData.contains(mRecycleRect);
        }
    }

}