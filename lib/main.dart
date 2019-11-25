import 'package:flutter/material.dart';
import 'package:flutter_app_hello/page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyView()
    );
  }
}

class MyView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '文本是视图系统中的常见控件，用来显示一段特定样式的字符串，就比如Android里的TextView，或是iOS中的UILab',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red),
      ),
    );
  }

}