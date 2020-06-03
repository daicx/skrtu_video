import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skrtuvideo/component/myvideo_player.dart';

import 'myimg_item.dart';

class MyGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyGridView();
  }
}

class _MyGridView extends State<MyGridView> {
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
                maxCrossAxisExtent: 600.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Material(
                  child: Container(
//                    color: Colors.green,
                    child: MyImgItem(
                      id: 1,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                );
              } else {
                return Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
//                    color: Colors.green,
                    child: MyVideoPlayer(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
