package com.zhumingwei.flutter_app_hello;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        Registrar registrar = registrarFor("com.hangchen/NativeViews");
        SampleViewFactory sampleViewFactory = new SampleViewFactory(registrar.messenger());
        registrar.platformViewRegistry().registerViewFactory("SampleView", sampleViewFactory);
    }
}

class SampleViewFactory extends PlatformViewFactory {

    BinaryMessenger messenger;

    public SampleViewFactory(BinaryMessenger msger) {
        super(StandardMessageCodec.INSTANCE);
        messenger = msger;
    }

    @Override
    public PlatformView create(Context context, int id, Object o) {
        return new SimpleViewControl(context, id, messenger);
    }


}

class SimpleViewControl implements PlatformView, MethodChannel.MethodCallHandler {
    private final MethodChannel methodChannel;
    private final TextView view;

    public SimpleViewControl(Context context, int id, BinaryMessenger messenger) {
        view = new TextView(context);
        view.setText("textview");
        view.setBackgroundColor(Color.RED);

        methodChannel = new MethodChannel(messenger, "samples.chenhang/native_views_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() {

    }

    @Override
    public void onInputConnectionLocked() {

    }

    @Override
    public void onInputConnectionUnlocked() {

    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("changeBackgroundColor")) {
            view.setBackgroundColor(Color.rgb(0, 0, 255));
            result.success(0);
        } else {
            result.notImplemented();
        }
    }
}
