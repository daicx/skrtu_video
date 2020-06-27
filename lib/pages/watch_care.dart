import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtu/component/myartical_item.dart';

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
            SizedBox(
              width: 20,
            ),
            RaisedButton(
              color: care ? Colors.green : Colors.lightGreen,
              onPressed: () {
                setState(() {
                  care = !care;
                });
              },
              child: Text(
                care ? '已关注' : '关注',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 30,
                alignment: Alignment.bottomLeft,
                child: Text(
                  '关注：12,014,836   贴子：441,373,635',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            Spacer(),
            RaisedButton(
              color: sign ? Colors.green : Colors.lightGreen,
              onPressed: () {
                setState(() {
                  sign = !sign;
                });
              },
              child: Text(
                sign ? '已签到' : '签到',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 50.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: MyArticalItem(),
              );
            }),
      ),
    );
  }
}
