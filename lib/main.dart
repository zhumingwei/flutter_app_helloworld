import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: "Flutter Demo Home Page",
        ));
  }
}

const platform = MethodChannel('samples.chenhang/navigation');

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(title: Text("Default Page")),
      body:  Center(
          child:
          RaisedButton(child: Text("打开应用商店"), onPressed: () {
            platform.invokeMethod('openAppStore',[1,"2"]);
          })),

    );
  }


}

