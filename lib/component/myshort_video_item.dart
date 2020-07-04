import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtu/component/myvideo_play.dart';
import 'package:skrtu/pages/myshare_page.dart';
import 'package:skrtu/routers/routers.dart';

import 'level_icon.dart';

//首页-视频
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
  bool _care = false;
  bool _zan = false;

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = '视频作者';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'imgs/img_default.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: AutoSizeText(
                            name,
                            style: TextStyle(fontSize: 20),
                            minFontSize: 10,
                            maxLines: 1,
                          ),
                        ),
                        LevelIcon(
                          lv: widget.id,
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
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 65,
                      height: 30,
                      child: FlatButton(
                        color: Colors.lightBlueAccent,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text(
                          _care ? "已关注" : "关注",
                          style: TextStyle(fontSize: 10),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          setState(() {
                            _care = !_care;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AutoSizeText(
              '  ' + '长风破浪长浪长风破浪长风破浪',
              maxLines: 1,
              style: TextStyle(fontSize: 20),
              minFontSize: 10,
              stepGranularity: 10,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              flex: 9,
//              child: MyVideoPlayer()
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
              child: Row(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () =>
                    {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext build) {
                            return Center(child: MySharePage());
                          })
                    },
                    icon: Icon(Icons.share),
                    label: Text('分享'),
                    textColor: Colors.black54,
                    highlightColor: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlueAccent,
                  ),
                  FlatButton.icon(
                    onPressed: () =>
                    {Routes.navigateTo(context, Routes.watch)},
                    icon: Icon(Icons.comment),
                    label: Text('评论'),
                    textColor: Colors.black54,
                    highlightColor: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlueAccent,
                  ),
                  FlatButton.icon(
                    onPressed: () =>
                    {
                      setState(() {
                        _zan = !_zan;
                      })
                    },
                    icon: _zan
                        ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                        : Icon(Icons.favorite_border),
                    label: Text(_zan ? '取消赞' : '点赞'),
                    textColor: Colors.black54,
                    highlightColor: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlueAccent,
                  ),
                  Spacer(),
                  PopupMenuButton(
                    tooltip: "更多",
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black54,
                    ),
                    onSelected: (va) {
                      print(va);
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: '0',
                          child: Text('收藏'),
                        ),
                        PopupMenuItem<String>(
                          value: '1',
                          child: Text('举报'),
                        ),
                        PopupMenuItem<String>(
                          value: '2',
                          child: Text('不感兴趣'),
                        ),
                        PopupMenuItem<String>(
                          value: '3',
                          child: Text('加入播放队列'),
                        ),
                      ];
                    },
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
