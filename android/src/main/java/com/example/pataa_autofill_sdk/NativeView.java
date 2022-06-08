package com.example.pataa_autofill_sdk;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

class NativeView implements PlatformView {
    private final com.pataa.sdk.PataaAutoFillView pataa;

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        pataa = new com.pataa.sdk.PataaAutoFillView(context, new com.pataa.sdk.OnAddress() {
            @Override
            public void onNetworkIsNotAvailable() {
                System.out.println("Native response: No network");
            }

            @Override
            public void onPataaNotFound(String message) {
                System.out.println("Native response: " + message);
                try {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("error", message);

                    PataaAutofillSdkPlugin.channel.invokeMethod("pataa_autofill_sdk", jsonObject.toString());
                }catch (Exception ee){
                    ee.printStackTrace();
                }
            }

            @Override
            public void onPataaFound(com.pataa.sdk.User user, com.pataa.sdk.Pataa response) {

                try {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("pataaCode", response.getPataa_code());
                    jsonObject.put("address1", response.getAddress1());
                    jsonObject.put("address2", response.getAddress2());
                    jsonObject.put("address3", response.getAddress3());
                    jsonObject.put("address4", response.getAddress4());
                    jsonObject.put("zipcode", response.getZipcode());
                    jsonObject.put("cityName", response.getCity_name());
                    jsonObject.put("stateCode", response.getState_code());
                    jsonObject.put("stateName", response.getState_name());
                    jsonObject.put("countryCode", response.getCountry_code());
                    jsonObject.put("countryName", response.getCountry_name());
                    jsonObject.put("qrCode", response.getQr_code());
                    jsonObject.put("firstName", user.getFirst_name());
                    jsonObject.put("lastName", user.getLast_name());
                    jsonObject.put("userCountryCode", user.getCountry_code());
                    jsonObject.put("mobile", user.getMobile());

                    System.out.println("Native response1: " + user.getFirst_name());
                    System.out.println("Native response2: " + response.getFormattedAddress());

                    PataaAutofillSdkPlugin.channel.invokeMethod("pataa_autofill_sdk", jsonObject.toString());
                }catch (Exception ee){
                    ee.printStackTrace();
                }
            }
        }).setCurrentActivity((Activity) context, creationParams.get("secretKeyAndroid").toString());
//        Activity activity = ((Activity) context);


    }

    @NonNull
    @Override
    public View getView() {
        return pataa;
    }

    @Override
    public void dispose() {
    }
}