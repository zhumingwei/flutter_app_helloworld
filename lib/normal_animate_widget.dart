import 'package:flutter/material.dart';

class NormalAnimateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NormalAnimateState();
  }
}

class _NormalAnimateState extends State<NormalAnimateWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    animation = Tween(begin: 0.0, end: 200.0).animate(curve)
      ..addListener(() => setState(() {}));
    controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
