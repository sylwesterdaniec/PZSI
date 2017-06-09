package com.wspa.dm.eopiekun;

import android.content.Intent;

import android.location.LocationManager;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import android.widget.TextView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

//import location

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Geocoder;
import android.location.Location;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.design.widget.Snackbar;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;






public class GetLocation extends AppCompatActivity {
    Button b1;
 TextView test;
   static Context context;
    String finaladresstring;
    private FirebaseAuth auth;
    private FirebaseAuth.AuthStateListener authListener;

    private DatabaseReference mDatabase;
    String uid;




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get_location);
        GetLocation.context = getApplicationContext();
       b1 = (Button) findViewById(R.id.locbutton);
        test = (TextView) findViewById(R.id.location_text);

        mDatabase = FirebaseDatabase.getInstance().getReference();
//get firebase auth instance
        auth = FirebaseAuth.getInstance();

        //get current user
        final FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
        uid=user.getUid();
        authListener = new FirebaseAuth.AuthStateListener() {
            @Override
            public void onAuthStateChanged(@NonNull FirebaseAuth firebaseAuth) {
                FirebaseUser user = firebaseAuth.getCurrentUser();
                if (user == null) {
                    // user auth state is changed - user is null
                    // launch login activity
                    startActivity(new Intent(GetLocation.this, LoginActivity.class));
                    finish();
                }


            }
        };


        b1.setOnClickListener(new View.OnClickListener() {
            @Override
           public void onClick(View v) {
                senddb();

            }
        });



    }












    void senddb()
    {

      //  DatabaseReference childRef = mDatabase.push();
            mDatabase.child("users").child(uid).push().setValue("lel");


    }











}

