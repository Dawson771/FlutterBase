import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(mainApp());
    
}
// 无状态组件 --自定义组件中的一种  无交互的组件
class mainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "flutter 无状态组件",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("app bar"),
        ),
        body: Center(
          child: Text("中部区无状态组件"),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: Text("bottomNavigationBar"),
          ),
        ),  
      ));
  }

}