// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     title: "flutter app",
//     theme: ThemeData(scaffoldBackgroundColor: Colors.green),
//     home: Scaffold()));
// }

// 应用入口：lib/main.dart
// Flutter 应用的根入口，初始化根组件，设置应用主题，将 HomeScreen 作为首页。

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_base/screens/home_screen.dart'; // 引入JSON序列化/反序列化库
// import 'package:todo_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 关闭应用调试标签
      debugShowCheckedModeBanner: false,
      // 应用标题
      title: 'Flutter 待办事项',
      // 应用主题：使用Material设计，设置主色调
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // 适配Material 3设计规范
        useMaterial3: true,
      ),
      // 应用首页：待办主页面
      home: const HomeScreen(),
    );
  }
}