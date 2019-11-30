import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
/*
 数据Event传递
 */
class CustomEvent {
  String msg;

  CustomEvent(this.msg);
}

//可以全局共享一个实例
EventBus eventBus = new EventBus();

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  String msg = "通知：";
  StreamSubscription subscription;

  @override
  void initState() {
    subscription = eventBus.on<CustomEvent>().listen((event) {
      print(event);
      setState(() {
        msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Text(msg),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()))),
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
      ),
      body: RaisedButton(
        onPressed: () => eventBus.fire(CustomEvent("hello")),
        child: Text('Fire Event'),
      ),
    );
  }
}
