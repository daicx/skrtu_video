import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtu/component/mybutton.dart';

void main() => runApp(MyApp());

//发表作品 页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: MySubmitPage(),
    );
  }
}

class MySubmitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySubmitPage();
  }
}

class _MySubmitPage extends State<MySubmitPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Scaffold(
              body: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'imgs/img_default.png',
                    width: 30,
                    height: 30,
                  ),
                  Text(
                    '阿达大',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 11),
                    textScaleFactor: 1.5,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                autofocus: true,
                maxLength: 50,
                decoration: InputDecoration(
                    hintText: "提个问题", prefixIcon: Icon(Icons.help)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  MyFlatButton(
                    text: '回答问题',
                    img: 'imgs/answer.png',
                    textColor: Colors.black54,
                    onPress: () => {},
                  ),
                  MyFlatButton(
                    text: '发布视频',
                    img: 'imgs/put_video.png',
                    textColor: Colors.black54,
                    onPress: () => {},
                  ),
                  MyFlatButton(
                    text: '发表文章',
                    img: 'imgs/artical.png',
                    textColor: Colors.black54,
                    onPress: () => {},
                  ),
                  MyFlatButton(
                    text: '发表想法',
                    img: 'imgs/idea.png',
                    textColor: Colors.black54,
                    onPress: () => {},
                  ),
                ],
              ),
            ],
          )),
        ));
  }
}
