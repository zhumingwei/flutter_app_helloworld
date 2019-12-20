package com.bilibili.comic.flutterapplication

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import io.flutter.facade.Flutter


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val FlutterView: View =
            Flutter.createView(this, lifecycle, "defaultRoute") //传入路由标识符
        setContentView(FlutterView) //用FlutterView替代Activity的ContentView
    }
}
