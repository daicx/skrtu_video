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
      body: Row(
        children: [
          Expanded(
            flex: wid <= 800 ? 0 : 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.grey,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orange[700]]), //背景渐变
                          borderRadius: BorderRadius.circular(10.0), //3像素圆角
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
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: MyTieziContentList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: wid <= 800 ? 0 : 1,
            child: Container(
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }

  Widget getContent() {}
}
