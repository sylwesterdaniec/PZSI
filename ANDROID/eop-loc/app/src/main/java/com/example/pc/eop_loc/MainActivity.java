package com.example.pc.eop_loc;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.StrictMode;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

public class MainActivity extends Activity
        implements LocationListener {

    private static final int MY_PERMISSIONS_REQUEST = 0;
    Intent intentThatCalled;
    public double latitude;
    public double longitude;
    public LocationManager locationManager;
    public Criteria criteria;
    public String bestProvider;
Button b1;
    TextView t1, t2;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        intentThatCalled = getIntent();



        b1=(Button)findViewById(R.id.button);
        t1=(TextView)findViewById(R.id.textView);
        t2=(TextView)findViewById(R.id.textView2);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                getLocation();
                t1.setText(String.valueOf(latitude));
                t2.setText(String.valueOf(longitude));
            }
        });


    }



    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           String permissions[], int[] grantResults) {
        switch (requestCode) {
            case MY_PERMISSIONS_REQUEST: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    // permission was granted, yay! Do the
                    // contacts-related task you need to do.

                } else {

                    // permission denied, boo! Disable the
                    // functionality that depends on this permission.
                }
                return;
            }

            // other 'case' lines to check for other
            // permissions this app might request
        }
    }

    public static boolean isLocationEnabled(Context context)
    {
        //...............
        return true;
    }

    protected void getLocation() {
        if (isLocationEnabled(MainActivity.this)) {
            locationManager = (LocationManager)  this.getSystemService(Context.LOCATION_SERVICE);
            criteria = new Criteria();
            bestProvider = String.valueOf(locationManager.getBestProvider(criteria, true)).toString();

            //You can still do this if you like, you might get lucky:
            Location location = locationManager.getLastKnownLocation(bestProvider);
            if (location != null) {
                Log.e("TAG", "GPS is on");
                latitude = location.getLatitude();
                longitude = location.getLongitude();
               //!!!!!!!!!!
            }
            else{
                //This is what you need:
                locationManager.requestLocationUpdates(bestProvider, 1000, 0, this);
            }
        }
        else
        {
            //prompt user to enable location....
            //.................


        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        locationManager.removeUpdates(this);

    }

    @Override
    public void onLocationChanged(Location location) {
        //Hey, a non null location! Sweet!

        //remove location callback:
        locationManager.removeUpdates(this);

        //open the map:
        latitude = location.getLatitude();
        longitude = location.getLongitude();
        //!!!!!!!
    }

    @Override
    public void onStatusChanged(String provider, int status, Bundle extras) {

    }

    @Override
    public void onProviderEnabled(String provider) {

    }

    @Override
    public void onProviderDisabled(String provider) {

    }




}