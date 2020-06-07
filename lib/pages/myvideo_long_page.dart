import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skrtuvideo/component/myvideo_img_item.dart';
import 'package:skrtuvideo/component/myvideo_video_item.dart';

class MyVideoLongPage extends StatefulWidget {
  final int type;

  @override
  State<StatefulWidget> createState() {
    return _MyVideoLongPage();
  }

  MyVideoLongPage({this.type = 1});
}

class _MyVideoLongPage extends State<MyVideoLongPage> {
  final List<String> _items = [];

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
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: widget.type == 1 ? 500.0 : 600,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              if (widget.type == 1) {
                return Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    child: MyVideoImgItem(),
                  ),
                );
              } else {
                return Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    child: MyVideoVideoItem(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
