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
  final List<String> _hots = [];
  TabController _controller;
  bool result = false;

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
    _hots.addAll([
      '综合1212',
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
                            ),
                            onChanged: (a) {
                              if (a == '') {
                                setState(() {
                                  result = false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      new IconButton(
                        icon: new Icon(Icons.cancel),
                        color: Colors.grey,
                        iconSize: 18.0,
                        onPressed: () {
                          controller.clear();
                          setState(() {
                            result = false;
                          });
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
              if (controller.text != '') {
                setState(() {
                  result = true;
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        child: !result
            ? Padding(
                padding: EdgeInsets.all(10),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Material(
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
                                  AutoSizeText(_historys[index]),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          );
                        }, childCount: _historys.length),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 600.0,
                            childAspectRatio: 10 / 1,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0),
                      ),
                    ),
                    renderTitle('*热门搜索*'),
                    SliverPadding(
                      padding: EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Material(
                            borderRadius: BorderRadius.circular(10.0),
                            child: FlatButton(
                              color: Colors.black12,
                              onPressed: () {},
                              child: Row(
                                children: [
                                  AutoSizeText(
                                    (index + 1).toString() + '.',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AutoSizeText(_hots[index]),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.whatshot,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          );
                        }, childCount: _hots.length),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 600.0,
                            childAspectRatio: 10 / 1,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0),
                      ),
                    ),
                  ],
                ))
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

// Text组件需要用SliverToBoxAdapter包裹，才能作为CustomScrollView的子组件
  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void onItemTrap(int index) {
    setState(() {
      _selected = index;
    });
  }
}
