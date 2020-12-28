package com.pbph.autoclick.activity.optionitem;

import android.view.View;
import android.widget.TextView;

import com.pbph.autoclick.R;
import com.pbph.autoclick.model.OptionModel;
import com.pbph.autoclick.uitils.adapter.v2backup.abslistview.ViewHolder;

public class OptionItemViewHolder extends ViewHolder<OptionModel> {
    TextView textView;

    @Override
    protected int getLayout() {
        return R.layout.adapter_optionsitem;
    }

    @Override
    protected void getView(View view) {
        textView = view.findViewById(R.id.textView);
    }

    @Override
    protected void showView() {
        textView.setText(item.name);
    }
}
