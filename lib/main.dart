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
        child: FlatButton(
          color:Colors.yellow,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          colorBrightness: Brightness.dark,
          textColor: Colors.blue,
          onPressed: ()=> print("FlatButton pressed"),
          child: Row(children: <Widget>[Icon(Icons.add),Text("Add")],),
        ),
      ),
    );
  }

}