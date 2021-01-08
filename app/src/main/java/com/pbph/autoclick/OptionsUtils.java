package com.pbph.autoclick;

import com.pbph.autoclick.model.OptionModel;

import java.util.ArrayList;
import java.util.List;

public class OptionsUtils {

    public static List<OptionModel> list() {
        List<OptionModel> list = new ArrayList<>();
        OptionModel model;

        model = new OptionModel();
        model.name = "等待";
        model.cmd = "wait ";
        model.optionInputType =  OptionInputType.time;
        list.add(model);

        model = new OptionModel();
        model.name = "单击";
        model.cmd = "input tap ";
        model.optionInputType =  OptionInputType.xy1;
        list.add(model);


        model = new OptionModel();
        model.name = "滑动";
        model.cmd = "input swipe ";
        model.optionInputType =  OptionInputType.xy2;
        list.add(model);

        model = new OptionModel();
        model.name = "返回";
        model.cmd = "input keyevent 4";
        list.add(model);

        model = new OptionModel();
        model.name = "主页";
        model.cmd = "input keyevent 3";
        list.add(model);

        model = new OptionModel();
        model.name = "设置";
        model.cmd = "input keyevent 176";
        list.add(model);

        model = new OptionModel();
        model.name = "亮屏";
        model.cmd = "input keyevent 224";
        list.add(model);
        return list;
    }

    public enum OptionInputType {
        time, xy1, xy2, none
    }
}
