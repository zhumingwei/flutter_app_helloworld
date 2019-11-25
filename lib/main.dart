import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyView());
  }
}

class MyView extends StatelessWidget {
  TextStyle blackStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black);
  TextStyle redStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。'),
        padding: EdgeInsets.all(18.0),
        // 内边距
        margin: EdgeInsets.all(44.0),
        // 外边距
        width: 180.0,
        height: 240,
        alignment: Alignment.center,
        // 子Widget居中对齐
        decoration: BoxDecoration(
          //Container样式
          color: Colors.red, // 背景色
          borderRadius: BorderRadius.circular(10.0), // 圆角边框
        ),
      ),
    );
  }
}
