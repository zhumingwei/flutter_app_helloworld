
import 'package:flutter/material.dart';

/*
自widget通过
context.inheritFromWidgetOfExactType获取父控件（InheritedWidget）信息，方法做父到子的传递
包装一层StatefulWidget做到刷新页面
 */
class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void _incrementCounter() => setState(() {
    count++;
  });

  @override
  Widget build(BuildContext context) {
    return CountContainer(
      model: this,
      increment: _incrementCounter,
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget demo"),
      ),
      body: Text('You have pushed the button this many times:${state.model.count}'),
      floatingActionButton: FloatingActionButton(onPressed: state.increment,child: Icon(Icons.add),),
    );
  }
}

class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CountContainer);
  final _CounterPageState model;
  final Function() increment;
  CountContainer(
      {Key key,
        @required Widget child,
        this.model,
        this.increment})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant CountContainer oldWidget) {
    return model != oldWidget.model;
  }
}
