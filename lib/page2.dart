import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  Parent({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ParentState();
  }

}

class _ParentState extends State<Parent>{
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print("page2 parent initState......");
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("page2 parent setState......");
  }

  @override
  Widget build(BuildContext context) {
    print("page2 parent build......");
    return Scaffold(
      appBar: AppBar(title: Text("setState demo")),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            setState((){
              _counter++;
            });
          },
          child: Child(count:_counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(Parent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page2 parent didUpdateWidget......");
  }

  @override
  void deactivate() {
    super.deactivate();
    print('page2 parent dispose......');
  }

  @override
  void dispose() {
    super.dispose();
    print('page2 parent dipose......');
  }
}

class Child extends StatefulWidget {
  final int count;

  Child({Key key, this.count}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends State<Child> {

  @override
  Widget build(BuildContext context) {
    print("child build......");
    return Text('点击按钮看状态变化 count: ${widget.count}');
  }

  @override
  void initState() {
    super.initState();
    print("page2 child initState......");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page2 child didChangeDependencies......");
  }

  @override
  void didUpdateWidget(Child oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page2 child didUpdateWidget.......");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("page2 child deactivate......");
  }

  @override
  void dispose() {
    super.dispose();
    print("page2 child dispose");
  }

}























