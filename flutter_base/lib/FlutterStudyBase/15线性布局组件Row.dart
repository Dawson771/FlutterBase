import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
    
}
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("app bar"),
          centerTitle: true,
        ),
       
        body:Container(
          // alignment: Alignment.center,
          color: Colors.yellow,
          width: double.infinity,
          height: double.infinity,
          child:Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,  //主轴对齐方式 均分对齐
            // mainAxisAlignment: MainAxisAlignment.spaceAround,  //主轴对齐方式 环绕模式
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,  //主轴对齐方式 两端对齐
            // mainAxisAlignment: MainAxisAlignment.center,  //主轴对齐方式 居中对齐
            // mainAxisAlignment: MainAxisAlignment.start,  //主轴对齐方式 从头部开始对齐
            crossAxisAlignment: CrossAxisAlignment.center,  //主轴对齐方式 从尾部开始对齐

            children: [
              Container(
              color: Colors.blue,
              child: Text("Row的子组件"),
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
              ),
              Container(
              color: Colors.blue,
              child: Text("Column的子组件"),
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
              ),
              Container(
              color: Colors.blue,
              child: Text("Column的子组件"),
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
              ),
            ],        
            )
          )
        )
    );
  }
}