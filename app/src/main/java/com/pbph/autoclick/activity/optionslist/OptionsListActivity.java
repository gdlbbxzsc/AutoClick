package com.pbph.autoclick.activity.optionslist;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.pbph.autoclick.R;
import com.pbph.autoclick.activity.optionsdetail.OptionsDetailActivity;
import com.pbph.autoclick.uitils.adapter.v2backup.abslistview.DataAdapter;

public class OptionsListActivity extends Activity {

    Context context = this;

    TextView title;

    ListView listView;
    DataAdapter adapter;

    TextView add;
    TextView runCmd;
    TextView delete;

    SharedPreferences sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        sp = context.getSharedPreferences("OptionsList", Context.MODE_PRIVATE);

        setContentView(R.layout.activity_optionslist);

        title = findViewById(R.id.title);
        title.setText("功能列表");

        listView = findViewById(R.id.listView);
        adapter = new DataAdapter(context, listView, OptionsListViewHolder.class).singleChoice();
        adapter.notifyDataSetChanged();
        listView.setOnItemClickListener((parent, view, position, id) -> {
            adapter.choiceHelper.putChoice(position);
            String itemVo = (String) adapter.getItem(position);
            startActivity(new Intent(context, OptionsDetailActivity.class).putExtra("titleStr", itemVo));
        });

        add = findViewById(R.id.add);
        add.setOnClickListener(v -> showDialog());

        runCmd = findViewById(R.id.runCmd);
        runCmd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });
        delete = findViewById(R.id.delete);
        delete.setOnClickListener(v -> delete());
 
        loadData();
    }

    private void loadData() {

        int num = 0;

        while (true) {
            String titleStr = sp.getString(String.valueOf(num), "");
            if (TextUtils.isEmpty(titleStr)) break;

            adapter.addData(titleStr);

            num++;
        }
        adapter.notifyDataSetChanged();

    }

    private void showDialog() {
        final EditText editText = new EditText(this);
        new AlertDialog.Builder(this)
                .setView(editText)
                .setPositiveButton("yes", (dialogInterface, i) -> {

                    String title = editText.getText().toString();
                    if (TextUtils.isEmpty(title)) {
                        return;
                    }
                    for (Object obj : adapter.viewDataList) {
                        if (TextUtils.equals(title, (String) obj)) {
                            Toast.makeText(context, "重名了", Toast.LENGTH_SHORT).show();
                            return;
                        }
                    }
                    sp.edit().putString(adapter.getCount() + "", title).commit();

                    adapter.addData(title);
                    adapter.notifyDataSetChanged();
                }).setNegativeButton("no", null).show();
    }

    private void delete() {
        String str = (String) adapter.choiceHelper.getResult();
        if (str == null) {
            Toast.makeText(context, "请选择一条进行删除", Toast.LENGTH_SHORT).show();
            return;
        }
        int position = adapter.viewDataList.indexOf(str);

        new AlertDialog.Builder(context)
                .setTitle("确定删除么？")
                .setMessage(str)
                .setPositiveButton("yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        context.getSharedPreferences("OptionsDetail", Context.MODE_PRIVATE).edit().remove(str).commit();

                        sp.edit().remove(position + "").commit();

                        adapter.removeData(str);
                        adapter.notifyDataSetChanged();
                    }
                })
                .setNegativeButton("no", null)
                .show();
    }

}