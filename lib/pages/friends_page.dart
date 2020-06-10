import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: FriendsPage(),
    );
  }
}
//好友列表
class FriendsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FriendsPage();
  }
}

class _FriendsPage extends State<FriendsPage> {
  List<String> _datas;
  String content = '测试赛';
  int index = 0;

  @override
  void initState() {
    super.initState();
    _datas=[
      "1",
      "1",
      "1",
      "1",
      "1",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.black12,
          child: ListView.builder(
            itemCount: _datas.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            },
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          color: Colors.greenAccent,
        ),
      ),
    ]);
  }
  Widget getRow(int i) {
    Color textColor = Theme.of(context).primaryColor; //字体颜色
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: index == i ? Colors.grey : Colors.white,
          border: Border(
            left: BorderSide(
                width: 5,
                color:
                index == i ? Theme.of(context).primaryColor : Colors.white),
          ),
        ),
        child: Text(
          _datas[i],
          style: TextStyle(
            color: index == i ? textColor : Colors.black12,
            fontWeight: index == i ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          textColor = Colors.green;
        });
      },
    );
  }
}
