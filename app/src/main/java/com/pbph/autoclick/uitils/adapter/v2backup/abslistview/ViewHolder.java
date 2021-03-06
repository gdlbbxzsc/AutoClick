package com.pbph.autoclick.uitils.adapter.v2backup.abslistview;

import android.view.View;

public abstract class ViewHolder<T> {

    protected DataAdapter adapter;

    public int position;

    public T item;

    protected abstract int getLayout();

    protected abstract void getView(View view);

    protected abstract void showView();

}