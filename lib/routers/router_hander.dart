import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

var roothandle =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MyHomePage(
    title: "首页",
  );
});
