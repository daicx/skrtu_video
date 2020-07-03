import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'myimg_item.dart';
import 'myshort_video_item.dart';

//首页
class MyStateGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyStateGridView();
  }
}

class _MyStateGridView extends State<MyStateGridView> {
  final List<String> _items = [];
  int colCount = 2;


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
//    double width = MediaQuery.of(context).size.width;
//    int count = getColCount(width);
    setState(() {
      colCount = getColCount(MediaQuery
          .of(context)
          .size
          .width);
    });
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(5),
        // ignore: missing_required_param
        child: StaggeredGridView.countBuilder(
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return Material(
                child: Container(
                  child: MyImgItem(
                    id: index,
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              );
            } else {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: MyShortVideoItem(),
                ),
              );
            }
          },
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1.65),
          crossAxisCount: colCount,
//        maxCrossAxisExtent: 500,
        ),
      ),
    );
  }

  int getColCount(double len) {
    if (len < 1000) {
      return 2;
    } else if (len >= 1000 && len < 1500) {
      return 4;
    } else {
      return 6;
    }
  }
}
