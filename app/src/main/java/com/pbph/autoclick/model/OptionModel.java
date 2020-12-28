package com.pbph.autoclick.model;

import com.pbph.autoclick.OptionsUtils;

public class OptionModel {

    public String name;
    public String cmd;

    public String expl;

    public OptionsUtils.OptionInputType optionInputType = OptionsUtils.OptionInputType.none;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCmd() {
        return cmd;
    }

    public void setCmd(String cmd) {
        this.cmd = cmd;
    }

    public String getExpl() {
        return expl;
    }

    public void setExpl(String expl) {
        this.expl = expl;
    }

    public OptionsUtils.OptionInputType getOptionInputType() {
        return optionInputType;
    }

    public void setOptionInputType(OptionsUtils.OptionInputType optionInputType) {
        this.optionInputType = optionInputType;
    }
}



