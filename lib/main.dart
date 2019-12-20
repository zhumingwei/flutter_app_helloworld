import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultPage(
          title: "Flutter Demo Home Page",
        ));
  }
}

const platform = MethodChannel('samples.chenhang/navigation');

class DefaultPage extends StatefulWidget {
  final String title;

  DefaultPage({this.title});

  @override
  State<StatefulWidget> createState() => DefaultState();
}

class DefaultState extends State<DefaultPage> {
  NativeViewController controller;

  @override
  void initState() {
    super.initState();
    controller = NativeViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("Default Page"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          child: SimpleView(controller: controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.change_history),
        onPressed: () => controller.changeBackGroundColor(),
      ),
    );
  }
}

class SimpleView extends StatefulWidget {
  final NativeViewController controller;

  SimpleView({Key key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SimpleViewState();
}

class _SimpleViewState extends State<SimpleView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'SampleView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return UiKitView(
        viewType: 'SampleView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
  }

  _onPlatformViewCreated(int id) => widget.controller?.onCreate(id);
}

class NativeViewController {
  MethodChannel _channel;

  onCreate(int id) {
    _channel = MethodChannel('samples.chenhang/native_views_$id');
  }

  changeBackGroundColor() async {
    _channel.invokeMethod('changeBackgroundColor');
  }
}
