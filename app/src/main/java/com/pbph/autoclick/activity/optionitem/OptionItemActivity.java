package com.pbph.autoclick.activity.optionitem;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.pbph.autoclick.OptionsUtils;
import com.pbph.autoclick.R;
import com.pbph.autoclick.activity.getxy.GetxyActivity;
import com.pbph.autoclick.model.OptionModel;
import com.pbph.autoclick.uitils.StringUtils;
import com.pbph.autoclick.uitils.adapter.v2backup.abslistview.DataAdapter;

public class OptionItemActivity extends Activity {

    Context context = this;

    TextView title;

    GridView listView;
    DataAdapter adapter;


    private TextView tv_optionName;

    private TextView tvchoose;

    private TextView edtexpl;

    private LinearLayout llxy1;
    private EditText edtx1;
    private EditText edty1;
    private Button btnxy1;

    private LinearLayout llxy2;
    private EditText edtx2;
    private EditText edty2;
    private Button btnxy2;

    private LinearLayout llwait;
    private EditText edtwait;


    private TextView add;


    OptionModel nowOptionModel;

    private int requestCode_xy1 = 1001;
    private int requestCode_xy2 = 1002;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        String titleStr = intent.getStringExtra("titleStr");

        setContentView(R.layout.activity_optionitem);


        title = findViewById(R.id.title);
        title.setText(titleStr + "->操作流程");

        listView = findViewById(R.id.listView);

        adapter = new DataAdapter(context, listView, OptionItemViewHolder.class);
        adapter.setDatas(OptionsUtils.list());
        adapter.notifyDataSetChanged();
        listView.setOnItemClickListener((parent, view, position, id) -> {
            nowOptionModel = (OptionModel) adapter.getItem(position);
            changeOptionBoard();
        });

        tv_optionName = (TextView) findViewById(R.id.tv_optionName);

        tvchoose = findViewById(R.id.tvchoose);
        tvchoose.setOnClickListener(v -> {
            nowOptionModel = null;
            changeOptionBoard();
            listView.setVisibility(View.VISIBLE);
        });

        edtexpl = (TextView) findViewById(R.id.edtexpl);


        llxy1 = (LinearLayout) findViewById(R.id.llxy1);
        edtx1 = (EditText) findViewById(R.id.edtx1);
        edty1 = (EditText) findViewById(R.id.edty1);
        btnxy1 = (Button) findViewById(R.id.btnxy1);
        btnxy1.setOnClickListener(v -> getXY(requestCode_xy1));

        llxy2 = (LinearLayout) findViewById(R.id.llxy2);
        edtx2 = (EditText) findViewById(R.id.edtx2);
        edty2 = (EditText) findViewById(R.id.edty2);
        btnxy2 = (Button) findViewById(R.id.btnxy2);
        btnxy2.setOnClickListener(v -> getXY(requestCode_xy2));


        llwait = (LinearLayout) findViewById(R.id.llwait);
        edtwait = (EditText) findViewById(R.id.edtwait);


        add = (TextView) findViewById(R.id.add);
        add.setOnClickListener(v -> add());

        nowOptionModel = null;
        changeOptionBoard();
        listView.setVisibility(View.VISIBLE);
    }

    private void changeOptionBoard() {
        listView.setVisibility(View.GONE);
        llxy1.setVisibility(View.GONE);
        llxy2.setVisibility(View.GONE);
        llwait.setVisibility(View.GONE);

        edtx1.setText("");
        edty1.setText("");
        edtx2.setText("");
        edty2.setText("");

        edtwait.setText("");

        if (nowOptionModel == null) return;

        tv_optionName.setText(nowOptionModel.name);

        switch (nowOptionModel.optionInputType) {
            case xy1: {
                llxy1.setVisibility(View.VISIBLE);
            }
            break;
            case xy2: {
                llxy1.setVisibility(View.VISIBLE);
                llxy2.setVisibility(View.VISIBLE);
            }
            break;
            case time: {
                llwait.setVisibility(View.VISIBLE);
            }
            break;
            default: {
            }
            break;
        }
    }

    private void getXY(int requestCode) {
        startActivityForResult(new Intent(context, GetxyActivity.class), requestCode);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (getXYResult1(requestCode, resultCode, data)) return;
        if (getXYResult2(requestCode, resultCode, data)) return;
    }

    private boolean getXYResult1(int requestCode, int resultCode, Intent data) {
        if (requestCode != requestCode_xy1) return false;
        if (resultCode != RESULT_OK) return false;

        int x = data.getIntExtra("x", 0);
        int y = data.getIntExtra("y", 0);

        edtx1.setText(x + "");
        edty1.setText(y + "");
        return true;
    }

    private boolean getXYResult2(int requestCode, int resultCode, Intent data) {
        if (requestCode != requestCode_xy2) return false;
        if (resultCode != RESULT_OK) return false;
        edtx2.setText("1232");
        edty2.setText("2342");
        return true;
    }

    private void add() {
        if (nowOptionModel == null) {
            Toast.makeText(context, "请选择操作", Toast.LENGTH_SHORT).show();
            return;
        }

        String result;
        String x1, y1, x2, y2, wait;


        switch (nowOptionModel.optionInputType) {
            case xy1: {
                if ((x1 = checkInput(edtx1, "x1")) == null) return;
                if ((y1 = checkInput(edty1, "y1")) == null) return;

                result = nowOptionModel.cmd + x1 + " " + y1;

                if (TextUtils.isEmpty(edtexpl.getText().toString())) {
                    edtexpl.setText(x1 + "," + y1);
                }

            }
            break;
            case xy2: {
                if ((x1 = checkInput(edtx1, "x1")) == null) return;
                if ((y1 = checkInput(edty1, "y1")) == null) return;

                if ((x2 = checkInput(edtx2, "x2")) == null) return;
                if ((y2 = checkInput(edty2, "y2")) == null) return;

                result = nowOptionModel.cmd + x1 + " " + y1 + " " + x2 + " " + y2;

                if (TextUtils.isEmpty(edtexpl.getText().toString())) {
                    edtexpl.setText(x1 + "," + y1 + "->" + x2 + "," + y2);
                }
            }
            break;
            case time: {
                if ((wait = checkInput(edtwait, "wait")) == null) return;
                result = nowOptionModel.cmd + wait;
                if (TextUtils.isEmpty(edtexpl.getText().toString())) {
                    edtexpl.setText(wait + "秒");
                }
            }
            break;
            default: {
                result = nowOptionModel.cmd;
            }
            break;
        }

        Intent intent = new Intent();
        intent.putExtra("name", nowOptionModel.name);
        intent.putExtra("cmd", result);
        intent.putExtra("expl", edtexpl.getText().toString());
        setResult(RESULT_OK, intent);
        finish();
    }

    private String checkInput(EditText edt, String toast) {
        String str = edt.getText().toString();

        if (TextUtils.isEmpty(str) || !StringUtils.isNumber(str)) {
            Toast.makeText(context, toast + "输入错误", Toast.LENGTH_SHORT).show();
            return null;
        }
        return str;
    }
}