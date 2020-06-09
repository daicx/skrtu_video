import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: VideoApp(),
    );
  }
}*/

class VideoApp extends StatefulWidget {
  VideoApp({this.url, this.title, this.color});

  final String url;
  final String title;
  final Color color;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  Duration videoLength;
  Duration videoPoision;
  Duration initalPoision = Duration(milliseconds: 800);
  double volume = 0.75;
  bool sliderVisual = false;
  bool showContro = true;
  double radio = 16 / 9;

  /// 记录是否全屏
//  bool get _isFullScreen =>
//      MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url ?? '')
      ..addListener(() {
        setState(() {
          videoPoision = _controller.value.position;
        });
      })
      ..initialize().then((_) {
        setState(() {
          videoLength = _controller.value.duration;
          _controller.seekTo(initalPoision);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          color: widget.color ?? Colors.grey,
          child: Column(children: <Widget>[
            if (_controller.value.initialized)
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 700),
                child: AspectRatio(
                  aspectRatio: radio,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onPanDown: (d) {
                          setState(() {
                            showContro = !showContro;
                          });
                        },
                        onDoubleTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Container(
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      if (showContro) overLay(),
                      if (!_controller.value.isPlaying)
                        Center(
                            child: IconButton(
                          hoverColor: Colors.red,
                          color: Colors.white,
                          icon: Icon(
                            Icons.play_circle_filled,
                          ),
                          onPressed: () => {_controller.play()},
                          iconSize: 60,
                        )),
                    ],
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //覆盖页
  Widget overLay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            widget.title ?? '',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: Container(),
        ),
//        Expanded(
//          flex: 2,
//          child: botomBar(),
//        ),
        botomBar(),
      ],
    );
  }

  //web无效
//  void _toggleFullScreen() {
//
//    setState(() {
//      SystemChrome.setEnabledSystemUIOverlays(
//          []);
//      if (_isFullScreen) {
//        /// 如果是全屏就切换竖屏
////        AutoOrientation.portraitAutoMode();
//
//        ///显示状态栏，与底部虚拟操作按钮
//        SystemChrome.setEnabledSystemUIOverlays(
//            [SystemUiOverlay.top, SystemUiOverlay.bottom]);
//      } else {
////        AutoOrientation.landscapeAutoMode();
//
//        ///关闭状态栏，与底部虚拟操作按钮
//        SystemChrome.setEnabledSystemUIOverlays([]);
//      }
////      _startPlayControlTimer(); // 操作完控件开始计时隐藏
//    });
//  }
//进度条和控制栏
  Widget botomBar() {
    return Column(
      children: <Widget>[
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          padding: EdgeInsets.all(10),
        ),
        Row(
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
            ),
            Text(
              '${formartDate(videoPoision)} / ${formartDate(videoLength)}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  volume = -volume;
                  _controller.setVolume(volume > 0 ? volume : 0);
                });
              },
              icon: Icon(getVolume(volume > 0 ? volume : 0)),
            ),
            Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              onChanged: (double _volume) {
                setState(() {
                  volume = _volume;
                  _controller.setVolume(_volume);
                });
              },
              value: volume > 0 ? volume : 0,
              min: 0,
              max: 1,
            ),
            Spacer(),
            IconButton(
              onPressed: () {
//                _toggleFullScreen();
              },
              icon: Icon(
                Icons.crop_free,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String formartDate(Duration date) {
    final sec = date.inSeconds % 60;
    final realSec = sec < 10 ? '0$sec' : sec;
    final min = date.inMinutes < 10 ? '0${date.inMinutes}' : date.inMinutes;
    final hour = date.inHours > 0 ? '${date.inHours}:' : '';
    return '$hour$min:$realSec';
  }

  IconData getVolume(double volume) {
    if (volume == 0) {
      return Icons.volume_off;
    } else if (volume > 0 && volume <= 0.33) {
      return Icons.volume_mute;
    } else if (volume > 0.33 && volume <= 0.6) {
      return Icons.volume_down;
    } else {
      return Icons.volume_up;
    }
  }
}
