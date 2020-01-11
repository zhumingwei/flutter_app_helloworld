import 'package:flutter/material.dart';

class MySlideTransition extends AnimatedWidget {
  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  MySlideTransition({
    Key key,
    Animation<Offset> position,
    this.child,
    this.transformHitTests = true,
  }) : super(key: key, listenable: position);

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
