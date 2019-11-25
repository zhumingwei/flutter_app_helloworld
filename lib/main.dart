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
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              height: 60,
            ),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 180,
          ),
          Container(
            color: Colors.black,
            width: 60,
            height: 80,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
