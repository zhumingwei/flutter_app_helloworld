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

  TextStyle blackStyle = TextStyle(
      fontWeight:FontWeight.normal,
      fontSize: 20,
      color:Colors.black
  );
  TextStyle redStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.red
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
              children: <TextSpan>[
                TextSpan(text: '文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似',style: redStyle),
                TextSpan(text: "Android", style: blackStyle),
                TextSpan(text:'中的', style:redStyle),
                TextSpan(text:'TextView', style: blackStyle)
              ]
          ),
          textAlign: TextAlign.center,

        ),
      ),
    );
  }

}