import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_tiezi_content_list.dart';

//控制评论和下一个播放
class MyTabBarTiezi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTabBarTiezi();
  }
}

class _MyTabBarTiezi extends State<MyTabBarTiezi> {
  int _selected = 0;
  String bodyContent;
  final List<String> _tabValues = [];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabValues.addAll([
      '看帖',
      '精华',
      '视频',
      '兔窝',
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
        backgroundColor: Colors.white,
        title: Center(child: getTabBar()),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
//          MyComponentView(),
          MyTieziContentList(),
          MyTieziContentList(),
          MyTieziContentList(),
          MyTieziContentList(),
        ],
      ),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      controller: _controller, //控制器
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _tabValues.map((e) {
        return Container(
          height: 40,
          width: 80,
          alignment: Alignment.center,
          child: Text(
            e,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
