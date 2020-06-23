import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//文章 内容页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: ArticalContentView(),
    );
  }
}

class ArticalContentView extends StatefulWidget {
  final List<String> hotels;

  ArticalContentView({this.hotels});

  @override
  _ArticalContentView createState() => _ArticalContentView();
}

class _ArticalContentView extends State<ArticalContentView>
    with SingleTickerProviderStateMixin {
  AnimationController _anim;

  List<String> _oldHotels;
  List<String> _testHotels = [];

  @override
  void initState() {
    _testHotels.addAll([
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '11',
    ]);
    _anim =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _anim.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
