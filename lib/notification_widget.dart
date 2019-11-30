
import 'package:flutter/material.dart';
/*
  定义 CustomNotification
  子控件调用dispatch方法发送事件，父控件通过NotificationListener接收事件
 */
class NotificationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NotificationWidgetState();
  }

}

class _NotificationWidgetState extends State<NotificationWidget> {
  String _msg = "通知:";
  @override
  Widget build(BuildContext context) {
    return NotificationListener<CustomNotification>(
      onNotification: (notification){
        setState(() {_msg += notification.msg+ "   ";});
        return true;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_msg),CustomChild()
        ],
      ),
    );
  }
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => CustomNotification("Hi").dispatch(context),
      child: Text("Fire notification"),
    );
  }

}

class CustomNotification extends Notification {
  CustomNotification(this.msg);
  final String msg;
}