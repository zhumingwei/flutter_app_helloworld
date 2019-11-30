import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: "this is title",
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.system_update),
              text: "组合",
            ),
            Tab(
              icon: Icon(Icons.cake),
              text: "自绘",
            ),
            Tab(
              icon: Icon(Icons.home),
              text: "指针事件",
            ),
            Tab(
              icon: Icon(Icons.rss_feed),
              text: "手势",
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
              text: "手势冲突",
            )
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return UpdatedItemWidget(
                  model: UpdatedItemModel(
                      appIcon: "assets/icon.png",
                      appDesc:
                          "Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                      appName: "Google Maps - ransit & Fond",
                      appSize: "137.2",
                      appVersion: "Version 5.19",
                      appDate: "2019年6月5日"),
                  onPressed: () {
                    print("onPressed");
                  });
            },
          ),
          Center(
            child: Cake(),
          ),
          ListenerWidget(),
          DragWidget(),
          DoubleGestureWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}

class DoubleGestureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawGestureDetector(
        gestures: {
          MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              MultipleTapGestureRecognizer>(
            () => MultipleTapGestureRecognizer(),
            (MultipleTapGestureRecognizer instance) {
              instance.onTap = () => print('parent tapped ');
            },
          )
        },
        child: Container(
          color: Colors.pinkAccent,
          child: Center(
            child: GestureDetector(
              child: Container(
                color: Colors.blueAccent,
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class DragWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<DragWidget> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
              onTap: () => print("tap"),
              onDoubleTap: () => print("doubletap"),
              onLongPress: () => print("Long press"),
              onPanUpdate: ((e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}

class ListenerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        child: Container(
          color: Colors.red,
          width: 300,
          height: 300,
        ),
        onPointerDown: (event) => print("down $event"),
        onPointerMove: (event) => print("move $event"),
        onPointerUp: (event) => print("up $event"),
        onPointerCancel: (event) => print("cancel $event"),
        onPointerEnter: (event) => print("enter $event"),
      ),
    );
  }
}

class UpdatedItemWidget extends StatelessWidget {
  final UpdatedItemModel model;
  final VoidCallback onPressed;

  UpdatedItemWidget({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildTopRow(context), buildBottomRow(context)],
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                model.appIcon,
                width: 80,
                height: 80,
              )),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.appName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)),
              ),
              Text(
                "${model.appDate}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: FlatButton(
            onPressed: onPressed,
            color: Color(0xFFF1F0F7),
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            child: Text(
              "OPEN",
              style: TextStyle(
                  color: Color(0xFF007AFE), fontWeight: FontWeight.bold),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model.appDesc),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("${model.appVersion} * ${model.appSize} MB"),
          )
        ],
      ),
    );
  }
}

class UpdatedItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDesc;
  String appVersion;

  UpdatedItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDesc,
      this.appVersion});
}

class Cake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WheelPainter(),
    );
  }
}

class WheelPainter extends CustomPainter {
  getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width, size.height) / 2;
    double nbElem = 6;
    double radius = (2 * pi) / nbElem;
    Rect boundingRect = Rect.fromCircle(
        center: Offset(wheelSize, wheelSize), radius: wheelSize);
//画圆弧，每次1/6个圆弧
    canvas.drawArc(
        boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(
        boundingRect, radius, radius, true, getColoredPaint(Colors.black38));
    canvas.drawArc(
        boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(
        boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(
        boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(
        boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
