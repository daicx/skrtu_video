import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtu/routers/routers.dart';

import 'myvideo_play.dart';

class MyVideoVideoItem extends StatefulWidget {
  MyVideoVideoItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyVideoVideoItem();
  }
}

class _MyVideoVideoItem extends State<MyVideoVideoItem> {
  String name;
  double hover = 0;
  double imgHover = 50;
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
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: FlatButton(
          onPressed: () {
            Routes.navigateTo(context, Routes.watch);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: AspectRatio(
                  aspectRatio: 15 / 9,
                  child: MyVideo(
                    url:
                    'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4',
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '长风破浪长风破浪长风222,破浪长风破浪长风破浪长风破浪',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    hoverColor: Colors.lightBlueAccent,
                    onHover: (a) {},
                    onTap: () => {},
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'imgs/img_default.png',
                          width: imgHover,
                          height: imgHover,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        hoverColor: Colors.lightBlueAccent,
                        onHover: (a) {},
                        onTap: () => {},
                        child: Row(
                          children: <Widget>[
                            Text(
                              name,
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                              textScaleFactor: 1.5,
                            ),
                            Image.asset(
                              'imgs/img_default.png',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      Text(
                        '1212 次观看  ◉ 2天前',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 4),
                      ),
                    ],
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.comment),
                    onPressed: () => {Routes.navigateTo(context, Routes.watch)},
                    label: Text('30'),
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                        height: 30,
                        child: FlatButton(
                          color: Colors.lightBlueAccent,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Text(
                            "关注",
                            style: TextStyle(fontSize: 10),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
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
