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
      body: Padding(
        padding: EdgeInsets.all(44.0),
        child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。'),
      ),
    );
  }
}
