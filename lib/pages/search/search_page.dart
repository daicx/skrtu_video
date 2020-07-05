import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtu/component/mystate_grid_view.dart';

//查询页面

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  int _selected = 0;
  final controller = TextEditingController();
  final List<String> _tabValues = [];
  final List<String> _historys = [];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabValues.addAll([
      '综合',
      '图文',
      '问答',
      '视频',
      '用户',
      '兔窝',
    ]);
    _historys.addAll([
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
    ]);
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 60.0,
          child: new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new Card(
                child: new Container(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: TextField(
                              maxLength: 100,
                              style: TextStyle(fontSize: 20),
                              controller: controller,
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(top: 0.0),
                                hintText: 'Search',
                                border: InputBorder.none,
                              )
                              // onChanged: onSearchTextChanged,
                              ),
                        ),
                      ),
                      new IconButton(
                        icon: new Icon(Icons.cancel),
                        color: Colors.grey,
                        iconSize: 18.0,
                        onPressed: () {
                          controller.clear();
                          // onSearchTextChanged('');
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              var a = controller.text;
              print(a + '----');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: controller.text == ''
            ? GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600.0,
                    childAspectRatio: 10 / 1,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0 //宽高比为2
                    ),
                children: <Widget>[
                  for (String a in _historys)
                    Material(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FlatButton(
                        color: Colors.black12,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 5,
                            ),
                            AutoSizeText('22'),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: getTabBar(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        for (String i in _tabValues) MyStateGridView()
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      indicatorColor: Colors.white,
      controller: _controller,
      //控制器
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _tabValues.map((e) {
        return Container(
          height: 50,
          width: 80,
          alignment: Alignment.center,
          child: Text(e),
        );
      }).toList(),
    );
  }

  void onItemTrap(int index) {
    setState(() {
      _selected = index;
    });
  }
}
