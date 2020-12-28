package com.pbph.autoclick.activity.optionsdetail;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.pbph.autoclick.R;
import com.pbph.autoclick.activity.optionitem.OptionItemActivity;
import com.pbph.autoclick.model.OptionModel;
import com.pbph.autoclick.uitils.adapter.v2backup.abslistview.DataAdapter;

import java.util.ArrayList;
import java.util.List;

public class OptionsDetailActivity extends Activity {

    Context context = this;

    TextView title;

    ListView listView;
    DataAdapter adapter;

    TextView add;
    TextView delete;
    TextView moveup;
    TextView movedown;

    String titleStr;

    SharedPreferences sp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();

        titleStr = intent.getStringExtra("titleStr");

        sp = context.getSharedPreferences("OptionsDetail", Context.MODE_PRIVATE);

        setContentView(R.layout.activity_optionsdetail);


        title = findViewById(R.id.title);
        title.setText(titleStr + "->操作流程");

        listView = findViewById(R.id.listView);

        adapter = new DataAdapter(context, listView, OptionsDetailViewHolder.class).singleChoice();
        listView.setOnItemClickListener((parent, view, position, id) -> {
            boolean b = adapter.choiceHelper.isChoiced(position);
            if (b) {
                adapter.choiceHelper.clearChoices();
            } else {
                adapter.choiceHelper.putChoice(position);
            }
            adapter.notifyDataSetChanged();
        });

        add = findViewById(R.id.add);
        add.setOnClickListener(v -> startActivityForResult(new Intent(context, OptionItemActivity.class), 100));

        delete = findViewById(R.id.delete);
        delete.setOnClickListener(v -> delete());
        moveup = findViewById(R.id.moveup);
        moveup.setOnClickListener(v -> move(true));
        movedown = findViewById(R.id.movedown);
        movedown.setOnClickListener(v -> move(false));

        loadData();
    }


    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
            new AlertDialog.Builder(context)
                    .setTitle("退出")
                    .setMessage("是否保存并退出")
                    .setPositiveButton("yes", (dialog, which) -> {
                        if (adapter.viewDataList.isEmpty()) return;

                        MyJson myJson = new MyJson();

                        myJson.viewDataList = new ArrayList<>(adapter.viewDataList.size());

                        for (Object obj : adapter.viewDataList) {
                            myJson.viewDataList.add((OptionModel) obj);
                        }
                        Gson gson = new Gson();
                        String json = gson.toJson(myJson);
                        sp.edit().putString(titleStr, json).commit();

                        finish();
                    })
                    .setNegativeButton("no", (dialog, which) -> finish())
                    .show();
            return true;
        }
        //继续执行父类其他点击事件
        return super.onKeyUp(keyCode, event);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (result(requestCode, resultCode, data)) return;

    }

    private boolean result(int requestCode, int resultCode, Intent data) {
        if (requestCode != 100) return false;
        if (resultCode != RESULT_OK) return false;

        OptionModel addVo = new OptionModel();

        addVo.name = data.getStringExtra("name");
        addVo.cmd = data.getStringExtra("cmd");
        addVo.expl = data.getStringExtra("expl");


        OptionModel vo = (OptionModel) adapter.choiceHelper.getResult();
        if (vo == null) {
            adapter.addData(addVo);
        } else {
            int pos = adapter.viewDataList.indexOf(vo);
            adapter.addData(pos + 1, addVo);
        }
        adapter.notifyDataSetChanged();
        return true;
    }

    private void loadData() {

        try {
            String json = sp.getString(titleStr, "");
            if (TextUtils.isEmpty(json)) return;

            MyJson myJson = new Gson().fromJson(json, MyJson.class);
            if (myJson == null) return;
            if (myJson.viewDataList == null || myJson.viewDataList.isEmpty()) return;

            for (OptionModel vo : myJson.viewDataList) {
                adapter.addData(vo);
            }
            adapter.notifyDataSetChanged();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private void delete() {
        OptionModel vo = (OptionModel) adapter.choiceHelper.getResult();
        if (vo == null) {
            Toast.makeText(context, "请选择一行进行删除", Toast.LENGTH_SHORT).show();
            return;
        }

        new AlertDialog.Builder(context)
                .setTitle("确定删除么？")
                .setMessage(vo.name + " " + vo.expl)
                .setPositiveButton("yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        adapter.removeData(vo);
                        adapter.notifyDataSetChanged();
                    }
                })
                .setNegativeButton("no", null)
                .show();
    }

    private void move(boolean b) {
        OptionModel vo = (OptionModel) adapter.choiceHelper.getResult();
        if (vo == null) {
            Toast.makeText(context, "请选择一行进行移动", Toast.LENGTH_SHORT).show();
            return;
        }

        int pos = adapter.viewDataList.indexOf(vo);
        adapter.removeData(vo);

        pos += b ? -1 : 1;
        adapter.addData(pos, vo);

    }

    private class MyJson {
        private List<OptionModel> viewDataList;

        public List<OptionModel> getViewDataList() {
            return viewDataList;
        }

        public void setViewDataList(List<OptionModel> viewDataList) {
            this.viewDataList = viewDataList;
        }
    }
}