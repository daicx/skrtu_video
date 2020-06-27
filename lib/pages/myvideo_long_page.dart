import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skrtu/component/myvideo_img_item.dart';

//视频-长视频页面
class MyVideoLongPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyVideoLongPage();
  }
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
                maxCrossAxisExtent: 500.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: MyVideoImgItem(
                    id: index,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
