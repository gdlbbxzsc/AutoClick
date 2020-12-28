package com.pbph.autoclick.activity.optionslist;

import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import com.pbph.autoclick.R;
import com.pbph.autoclick.uitils.adapter.v2backup.abslistview.ViewHolder;

public class OptionsListViewHolder extends ViewHolder<String> {
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
        textView.setText(item);
        textView.setBackgroundColor(adapter.choiceHelper.isChoiced(position) ? Color.GREEN : Color.WHITE);
    }
}
