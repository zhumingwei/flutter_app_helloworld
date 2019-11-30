
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//将动画和渲染职责分离，语法糖 animation传递到里面
class WidgetAnimateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WidgetAnimateWidgetState();
  }

}

class _WidgetAnimateWidgetState extends State<WidgetAnimateWidget> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,duration: const Duration(milliseconds: 1000)
    );
    final CurvedAnimation curve = CurvedAnimation(
      parent: controller, curve: Curves.elasticOut
    );
    animation = Tween(begin: 50.0, end: 200.0).animate(curve);
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedLogo(animation: animation,),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation}):super(key: key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

}