package com.wspa.dm.eopiekun;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainPage extends AppCompatActivity {
 Button button1, button2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_page);
        button1=(Button) findViewById(R.id.profbtn);
        button2=(Button) findViewById(R.id.testloc);

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent1 = new Intent(MainPage.this, ProfileActivity.class);
                startActivity(intent1);

            }
        });

        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent2 = new Intent(MainPage.this, GetLocationAdress    .class);
                startActivity(intent2);

            }
        });






    }
}
