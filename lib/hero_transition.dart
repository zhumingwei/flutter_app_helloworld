

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1'),),
      body: GestureDetector(
        child: Row(children: <Widget>[
          Hero(
            tag: 'hero',
            child: Container(
              width: 100,
              height: 100,
              child: FlutterLogo(),
            ),
          ),
          Hero(tag: "text", child: Text('点击Logo查看效果'))

        ],),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Page2()));
        },
      ),
    );
  }

}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page2'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag:'hero',
              child: Container(
                width: 300,
                height: 300,
                child: FlutterLogo(),
              ),
            ),
            Hero(tag: "text", child: Text('点击Logo查看效果123')),
          ],
        ),
      ),
    );
  }

}