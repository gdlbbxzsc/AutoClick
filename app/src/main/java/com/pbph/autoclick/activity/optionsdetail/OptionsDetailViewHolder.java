package com.pbph.autoclick.activity.optionsdetail;

import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import com.pbph.autoclick.R;
import com.pbph.autoclick.model.OptionModel;
import com.pbph.autoclick.uitils.adapter.v2backup.abslistview.ViewHolder;

public class OptionsDetailViewHolder extends ViewHolder<OptionModel> {
    TextView textView;

    @Override
    protected int getLayout() {
        return R.layout.adapter_optionslist;
    }

    @Override
    protected void getView(View view) {
        textView = view.findViewById(R.id.textView);
    }

    @Override
    protected void showView() {

        textView.setText(item.name + " " + item.expl);

        textView.setBackgroundColor(adapter.choiceHelper.isChoiced(position) ? Color.GREEN : Color.WHITE);
    }
}
