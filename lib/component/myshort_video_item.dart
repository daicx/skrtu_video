import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtuvideo/component/myvideo_play.dart';
import 'package:skrtuvideo/routers/routers.dart';

class MyShortVideoItem extends StatefulWidget {

  MyShortVideoItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyShortVideoItem();
  }
}

class _MyShortVideoItem extends State<MyShortVideoItem> {
  String name;
  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = '视频作者';

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: ,
//        backgroundColor: Colors.white,
//      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            ),
            Expanded(
              flex: 1,
              child: Text(
                '长风破浪长风破浪长风,破浪长风破浪长风破浪长风破浪',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Expanded(
              flex: 9,
//              child: MyVideoPlayer()
              child: VideoApp(url:
                'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4',color: Colors.white,)
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.share),
                    label: Text('分享'),
                    textColor: Colors.black54,
                    highlightColor: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlueAccent,
                  ),
                  FlatButton.icon(
                    onPressed: () => {Routes.navigateTo(context, Routes.watch)},
                    icon: Icon(Icons.comment),
                    label: Text('评论'),
                    textColor: Colors.black54,
                    highlightColor: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlueAccent,
                  ),
                  FlatButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.favorite_border),
                    label: Text('点赞'),
                    textColor: Colors.black54,
                    highlightColor: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlueAccent,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.black54,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
