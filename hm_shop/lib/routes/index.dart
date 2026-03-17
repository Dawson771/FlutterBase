//管理路由
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    //命名路由
    initialRoute: '/',
    routes: getRootRoutes(),
  );
}

//返回该app的路由的配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => MainPage(), //主页
    '/login': (context) => LoginPage(), //登录页面
  };
}
