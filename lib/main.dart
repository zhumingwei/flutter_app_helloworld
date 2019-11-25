import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyView());
  }
}

class MyView extends StatelessWidget {
  TextStyle blackStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black);
  TextStyle redStyle =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            ParallelWidget(),
            ScrollNotificationWidget(),
            ScrollControllerWidget(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home), text: '视差',),
            Tab(icon: Icon(Icons.rss_feed), text: "Notification",),
            Tab(icon: Icon(Icons.perm_identity), text: "Controller",)
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}

class ParallelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('CustomScrollView Demo'), // 标题
          floating: true,
          flexibleSpace: Image.network(
              "https://media-cdn.tripadvisor.com/media/photo-s/13/98/8f/c2/great-wall-hiking-tours.jpg",
              fit: BoxFit.cover),
          expandedHeight: 280,

        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index'),),
              childCount: 100

          ),
        )
      ],
    );
  }
}

class ScrollNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Scroll Notification Demo',
        home: Scaffold(
          appBar: AppBar(title: Text('ScrollController Demo'),),
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) { // 滚动开始
                print('Scroll Start');
              } else
              if (scrollNotification is ScrollUpdateNotification) { // 滚动位置更新
                // ignore: missing_return
                print('Scroll Update');
                // ignore: missing_return
              } else if (scrollNotification is ScrollEndNotification) { // 滚动结束
                print('Scroll End');
              }
              return true;
            },
            child: ListView.builder(itemBuilder: (context, index) =>
                ListTile(title: Text("Index : $index")), itemCount: 30,),
          ),
        )
    );
  }
}

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }

}

class _ScrollControllerState extends State<ScrollControllerWidget> {
  ScrollController _controller;
  bool isToTop = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 1000) {
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300) {
        setState(() {
          isToTop = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll Controller Widget'),),
      body: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            child: RaisedButton(
              child: Text("top"),
              onPressed: (isToTop ? () {
                if (isToTop) {
                  _controller.animateTo(
                      .0, duration: Duration(microseconds: 200,seconds: 2),
                      curve: Curves.ease);
                }
              } : null),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller, //传入控制器
              itemBuilder: (context,index)=>
                ListTile(title: Text("Index : $index"),),
            ),
          )

        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}















