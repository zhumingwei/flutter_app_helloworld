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
      body: ListView.builder(
        itemCount: 100,
          itemExtent: 50.0,
          //itemExtent 并不是一个必填参数。但强烈建议你提前设置好这个参数的值,避免频繁计算
          itemBuilder: (BuildContext context, int index) =>
              ListTile(title: Text("title $index"),subtitle: Text("body $index"),),
      ),
    );
  }
}
