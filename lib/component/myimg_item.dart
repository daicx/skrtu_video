import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyImgItem extends StatefulWidget {
  MyImgItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyImgItem();
  }
}

class _MyImgItem extends State<MyImgItem> {
  String name;

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = "而且大都";
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
                      style: TextStyle(color: Colors.black, fontSize: 4),
                    ),
                    Image.asset(
                      'imgs/img_default.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: 3,
                  color: Colors.white,
                ),
                Text(
                  '关注 32KW  活跃 333KW',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 4),
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
                    child: Text("关注",style: TextStyle(fontSize: 10),),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  ),
                ),

              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
