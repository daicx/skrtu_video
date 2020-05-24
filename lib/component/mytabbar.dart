import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _MyTabBar();
  }
}

class _MyTabBar extends State<MyTabBar> {
  int _selected = 0;
  String bodyContent;
  final List<String> _tabValues = [];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabValues.addAll([
      '英语',
      '化学',
      '物理2121',
      '数学',
      '生物',
      '体育',
      '经济',
    ]);
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Center(child: getTabBar()),
        actions: <Widget>[
          new Container(
            child: new Icon(Icons.arrow_drop_down),
            width: 48,
          )
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Center(
            child: Container(
              color: Colors.black12,
              child: Text(f),
            ),
          );
        }).toList(),
      ),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      controller: _controller, //控制器
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _tabValues.map((e) {
        return Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(e),
        );
      }).toList(),
    );
  }

  void onItemTrap(int index) {
    setState(() {
      _selected = index;
    });
  }
}
