import 'package:flutter/cupertino.dart';

class MyVideoItem extends StatefulWidget {

  MyVideoItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyVideoItem();
  }
}

class _MyVideoItem extends State<MyVideoItem> {

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
