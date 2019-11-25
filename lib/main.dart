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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("customScrollView Demo"),
            floating: true,
            flexibleSpace: Image.network('https://is.gd/ePQGqe',fit: BoxFit.cover,),
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index)=> ListTile(title: Text('Item #$index'),),
              childCount: 100,

            ),
          )
        ],
      ),
    );
  }
}
