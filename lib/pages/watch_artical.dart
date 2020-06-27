import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//发表作品 页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: WhatArtical(),
    );
  }
}

class WhatArtical extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WhatArtical();
  }
}

class _WhatArtical extends State<WhatArtical> {
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
                color: Colors.grey,
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orange[700]]),
                          //背景渐变
                          borderRadius: BorderRadius.circular(10.0),
                          //3像素圆角
                          boxShadow: [
                            //阴影
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0)
                          ]),
                      height: 200,
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'imgs/img_default.png',
                                  width: 150,
                                  height: 150,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '地下城与勇士吧',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textScaleFactor: wid >= 600 ? 1.5 : 1.3,
                                  ),
                                ),
                              ],
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.bottomLeft,
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    '关注：12,014,836  贴子：441,373,635',
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                              RaisedButton(
                                color: care ? Colors.blue : Colors.blueAccent,
                                onPressed: () {
                                  setState(() {
                                    care = !care;
                                  });
                                },
                                child: Text(
                                  care ? '已关注' : '关注',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              if (wid >= 800) Spacer(),
                              RaisedButton(
                                color: sign ? Colors.blue : Colors.blueAccent,
                                onPressed: () {
                                  setState(() {
                                    sign = !sign;
                                  });
                                },
                                child: Text(
                                  sign ? '已签到' : '签到',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
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
