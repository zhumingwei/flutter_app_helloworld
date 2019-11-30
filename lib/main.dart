import 'package:flutter/material.dart';
import 'package:flutter_app_hello/widget_animate_widget.dart';

import 'builder_animate_widget.dart';
import 'hero_transition.dart';
import 'normal_animate_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page1();
  }
}