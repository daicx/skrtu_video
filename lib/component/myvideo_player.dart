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

  @override
  void initState() {
    super.initState();
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
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.green,
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
