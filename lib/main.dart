import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skrtu/component/mybutton.dart';
import 'package:skrtu/pages/chat_page.dart';
import 'package:skrtu/pages/drawer_page.dart';
import 'package:skrtu/pages/friends_page.dart';
import 'package:skrtu/pages/mysubmit_page.dart';
import 'package:skrtu/pages/myteams.dart';
import 'package:skrtu/pages/myvideo_long_page.dart';
import 'package:skrtu/pages/myvideo_short_page.dart';
import 'package:skrtu/pages/myworks.dart';
import 'package:skrtu/routers/routers.dart';

import 'component/mystate_grid_view.dart';
import 'component/mytabbar.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skr兔',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Skr兔'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //当前选中的第几个底部菜单栏
  int _selected;

  String imgPath = 'imgs/';

  final controller = TextEditingController();

  TabController _controller;

  List<String> _tabTitle = [];
  List<Widget> tabBoby;

  void _changeIndex(int index) {
    setState(() {
      _selected = index;
      switch (_selected) {
        case 0:
          {
            _tabTitle = [
              '关注',
              '推荐',
            ];
            tabBoby = [MyStateGridView(), MyTabBar()];
            break;
          }
        case 1:
          {
            _tabTitle = [
              '兔视',
              '兔影',
            ];
            tabBoby = [
              MyVideoLongPage(),
              MyVideoShortPage(),
            ];
            break;
          }
        case 2:
          {
            _tabTitle = [
              '会话',
              '好友列表',
            ];
            tabBoby = [
              ChatPage(),
              FriendsPage(),
            ];
            break;
          }
        case 3:
          {
            _tabTitle = ['作品', '兔窝'];
            tabBoby = [
              MyWorks(),
              MyTeams(),
            ];
            break;
          }
      }
    });
    //是否重置
//    _controller.animateTo(0,duration: Duration(milliseconds: 0));
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    _changeIndex(0);
  }

  //组装tab标题和内容
  Map<TabBar, Widget> getTabBar(List<String> _tabTitle, List<Widget> tabBoby) {
    return {
      TabBar(
        controller: _controller, //控制器
        indicatorSize: TabBarIndicatorSize.label,
        tabs: _tabTitle.map((e) {
          return Container(
            height: 50,
            width: 80,
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ): Center(
        child: TabBarView(
          controller: _controller,
          children: tabBoby,
        ),
      )
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: 10,
              height: 10,
              child: GestureDetector(
                child: Image.asset(
                  'imgs/img_default.png',
                ),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
        automaticallyImplyLeading: false,
        title: getTabBar(_tabTitle, tabBoby).keys.first,
        centerTitle: true,
        actions: <Widget>[
          if(MediaQuery
              .of(context)
              .size
              .width >= 500)
            Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width / 3,
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
                                maxLength: 50,
                                style: TextStyle(fontSize: 20),
                                controller: controller,
                                decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 0.0),
                                    hintText: 'Search',
                                    border: InputBorder.none),
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
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
             Routes.navigateTo(context, Routes.searchPage);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            MyFlatButton(
              text: '首页',
              img: _selected == 0
                  ? imgPath + 'index1_select.png'
                  : imgPath + 'index1.png',
              textColor: _selected == 0 ? Colors.green : Colors.black54,
              onPress: () => {_changeIndex(0)},
            ),
            MyFlatButton(
              text: '影视',
              img: _selected == 1
                  ? imgPath + 'video_select.png'
                  : imgPath + 'video.png',
              textColor: _selected == 1 ? Colors.green : Colors.black54,
              onPress: () => {_changeIndex(1)},
            ),
            SizedBox(), //中间位置空出
            MyFlatButton(
              text: '消息',
              img: _selected == 2
                  ? imgPath + 'msg_select.png'
                  : imgPath + 'msg.png',
              textColor: _selected == 2 ? Colors.green : Colors.black54,
              onPress: () => {_changeIndex(2)},
            ),
            MyFlatButton(
              text: '我的',
              img: _selected == 3
                  ? imgPath + 'me_select.png'
                  : imgPath + 'me.png',
              textColor: _selected == 3 ? Colors.green : Colors.black54,
              onPress: () => {_changeIndex(3)},
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _selected == 2
          ? null
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext build) {
                          return Center(child: MySubmitPage());
                        })
                  }),
      body: getTabBar(_tabTitle, tabBoby).values.first,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
