package com.example.test01;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;
import android.widget.Toast;
import android.telephony.SmsManager;

public class MainActivity extends FlutterActivity {
    String CHANNEL = "vedaz.sms/SendSMS";
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),CHANNEL)
                .setMethodCallHandler(
                        (call,result)->{
                            //String arg1 = call.argument("message");
                            //here we call the main method which sendText in this case

                            if(call.method.equals("sendText")){
                                String msg = call.argument("message");  //Extract arguments from the message
                                String ctct = call.argument("contact"); //Extract the contact info from the message
                                int res = sendText(ctct,msg);           //This method is used to send the sms
                                result.success(1);
                            }
                        }
                );
    }

    //Our core method to send the sms through sms api
    int sendText(String ctct,String msg){
        SmsManager smsManager = SmsManager.getDefault();
        smsManager.sendTextMessage(ctct,null,msg,null,null);
        return 1;           //return a status code which we can further used to notify the user
    }
}
