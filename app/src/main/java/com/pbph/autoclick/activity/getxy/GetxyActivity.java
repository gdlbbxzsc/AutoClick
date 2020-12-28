package com.pbph.autoclick.activity.getxy;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;

import com.pbph.autoclick.R;

public class GetxyActivity extends Activity {

    Context context = this;

    TextView tv_xy_result;
    TextView tv_xy;

    int x = 0;
    int y = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_getxy);

        tv_xy_result = findViewById(R.id.tv_xy_result);
        tv_xy = findViewById(R.id.tv_xy);
        tv_xy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("x", x);
                intent.putExtra("y", y);
                setResult(RESULT_OK, intent);
                finish();
            }
        });
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int x = (int) event.getX();
        int y = (int) event.getY();
        tv_xy_result.setText("X:" + x + "  Y:" + y);
        return true;
    }

}