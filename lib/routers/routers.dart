import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:skrtu/routers/router_hander.dart';

class Routes {
//路由管理
  static FluroRouter router;
  static String root = "/";
  static String chat = "/chat";
  static String friendDetail = "/friend_detail";
  static String care = "/cares";
  static String collect = "/collects";
  static String watch = "/watchs";
  static String whatArticle = "/what_article";
  static String searchPage = "/search_page";

  static void configureRoutes(FluroRouter router) {
    // 未发现对应route
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('route not found!');
      return;
    });
    router.define(root, handler: roothandle);
    router.define(chat, handler: chathandle);
    router.define(friendDetail, handler: friendDetailhandle);
    router.define(care, handler: carehandle);
    router.define(collect, handler: collecthandle);
    router.define(watch, handler: watchthandle);
    router.define(whatArticle, handler: whatArticlehandle);
    router.define(searchPage, handler: searchPagehandle);
    Routes.router = router;
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
        TransitionType transition = TransitionType.native}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');
    path = path + query;
    return router.navigateTo(context, path, transition: transition);
  }
}
