import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:skrtuvideo/component/friend_detail.dart';
import 'package:skrtuvideo/component/mychat_view.dart';
import 'package:skrtuvideo/pages/mycare_page.dart';
import 'package:skrtuvideo/pages/mycollect_page.dart';
import 'package:skrtuvideo/pages/play_video_page.dart';
import 'package:skrtuvideo/pages/watch_article.dart';

import '../main.dart';

var roothandle =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyHomePage(
    title: "首页",
  );
});
var chathandle =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String title = params['title']?.first;
  return MyChatView(
    title: title,
  );
});
var friendDetailhandle =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String title = params['title']?.first;
  return FriendDetail(title: title);
});
var carehandle =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyCarePage();
});
var collecthandle =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyCollectPage();
});
var watchthandle =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return PlayVideoPage();
});
var whatArticlehandle =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return WhatArticle();
});
