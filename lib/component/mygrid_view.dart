import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'myimg_item.dart';
import 'myvideo_player.dart';

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
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500.0,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green,
//                child: Text(_items[index]),
                child: MyImgItem(
                  id: 1,
                ),
              );
            }));
  }
}
