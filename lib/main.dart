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
      body: Stack(
        children: <Widget>[
          Container(color: Colors.yellow,width: 300,height: 300,),
          Positioned(
            left: 18,
            top: 18,
            child: Container(color: Colors.green,width: 50,height: 50,),
          ),
          Positioned(
            left: 18,
            top: 70,
            child: Text("stack提供了层叠布局的容器"),
          )
        ],
      ),
    );
  }
}
