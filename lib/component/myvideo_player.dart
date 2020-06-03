import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  MyVideoPlayer({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyVideoPlayer();
  }
}

class _MyVideoPlayer extends State<MyVideoPlayer> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  String name;

  @override
  void initState() {
    super.initState();
    name = '视频页面';
    _videoPlayerController1 = VideoPlayerController.network(
        'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 16 / 9,

      autoPlay: false,
//      looping: true,
      // Try playing around with some of these other options:
//      showControls: false,
      showControlsOnInitialize: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
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
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ],
      ),
    );
  }
}
