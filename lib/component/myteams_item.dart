import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTeamsItem extends StatefulWidget {
  MyTeamsItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyTeamsItem();
  }
}

class _MyTeamsItem extends State<MyTeamsItem> {
  String name;
  Color click;
  final List<String> _items = [];

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = "而且大都";
    _items.addAll([
      '1',
      '1',
      '1',
      '1',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  'imgs/img_default.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 11),
                      textScaleFactor: 1.5,
                    ),
                    Image.asset(
                      'imgs/img_default.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  color: Colors.white,
                ),
                Text(
                  '关注 32 KW  活跃 333 KW',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 4),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              color: Colors.grey,
              icon: Icon(Icons.exit_to_app),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '简介:',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              '杜美蓉杜美蓉杜,美蓉杜美蓉杜美蓉杜美蓉',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  int getCount(int count) {
    if (count <= 3) {
      return count;
    } else {
      return 3;
    }
  }

  double getRatio(int count) {
    if (count == 1) {
      return 5 / 3;
    } else if (count == 2) {
      return 1;
    } else if (count >= 3) {
      return 1;
    }
  }
}
