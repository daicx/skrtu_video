import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  Duration videoLength;
  Duration videoPoision;
  double volume = 0.75;
  bool sliderVisual = false;
  bool showContro = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4')
      ..addListener(() {
        setState(() {
          videoPoision = _controller.value.position;
        });
      })
      ..initialize().then((_) {
        setState(() {
          videoLength = _controller.value.duration;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Column(children: <Widget>[
          if (_controller.value.initialized)
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 700),
              child: AspectRatio(
                aspectRatio: 16 / 9,
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
                    Icon(Icons.access_time)
                  ],
                ),
              ),
            ),
        ]),
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
            "标题",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
//          flex: 3,
          child: Container(
//            alignment: Alignment.center,
//            child: Icon(Icons.favorite_border),
//            color: Colors.green,
          ),
        ),
//        Expanded(
//          flex: 2,
//          child: botomBar(),
//        ),
        botomBar(),
      ],
    );
  }

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
              onPressed: () => setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              }),
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
