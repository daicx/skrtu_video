import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtuvideo/tiezi/my_tiezi_content_list.dart';

void main() => runApp(MyApp());

//发表作品 页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: WhatArticle(),
    );
  }
}

class WhatArticle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WhatArticle();
  }
}

class _WhatArticle extends State<WhatArticle> {
  bool sign = false;
  bool care = false;
  int contentLine = 4;
  final List<String> _items = [];
  double width = 320.0;

  @override
  void initState() {
    super.initState();
    _items.addAll([
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'imgs/img_default.png',
              width: 50,
              height: 50,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                '地下城与勇士吧',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15),
                textScaleFactor: 1.5,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: wid <= 800 ? 0 : 1,
              child: Container(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                color: Colors.black12,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
//                color: Colors.grey,
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
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
                                      '哒哒哒哒',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 11),
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
                                  '22小时前 ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 4),
                                ),
                              ],
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
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '《死路》讲述了一家人在圣诞前夕经历一场恐怖遭遇的故事。别忘点击订阅，打开小铃铛哦~加入频道会员，每周抢先观看2集未发布视频微信公众号：宇哥讲电影（求大家关注商务合作，请加微信yimingfirstfacebook主页：https://www.facebook.com/yugemv/',
                              style: TextStyle(fontSize: 15),
                              maxLines: contentLine,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  contentLine = contentLine == 4 ? 5 : 4;
                                });
                              },
//              hoverColor: ,
                              child: Text(contentLine == 4 ? '展开' : '收起'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
//                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text('看帖'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text('精华'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text('视频'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text('兔窝'),
                          ),
                        ],
                      ),
                    ),
                    for (var i in _items)
                      Column(
                        children: [
                          Row(
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
                                        '哒哒哒哒',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 11),
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
                                    '22小时前 ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 4),
                                  ),
                                ],
                              ),
                              Spacer(),
                              FlatButton.icon(
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                label: Text('212'),
                                textColor: Colors.black,
                                highlightColor: Colors.lightBlueAccent,
                                splashColor: Colors.lightBlueAccent,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '《死路》讲述了一家人在圣诞前夕经历一场恐怖遭遇的故事。别忘点击订阅，打开小铃铛哦~加入频道会员，每周抢先观看2集未发布视频微信公众号：宇哥讲电影（求大家关注商务合作，请加微信yimingfirstfacebook主页：https://www.facebook.com/yugemv/',
                                style: TextStyle(fontSize: 15),
                                maxLines: contentLine,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    contentLine = contentLine == 4 ? 5 : 4;
                                  });
                                },
//              hoverColor: ,
                                child: Text(contentLine == 4 ? '展开' : '收起'),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: wid <= 800 ? 0 : 1,
              child: Container(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                color: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContent() {}
}
