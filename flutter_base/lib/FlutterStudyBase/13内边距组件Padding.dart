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
          child:Padding(          //padding设置子组件内边距
            // padding: EdgeInsets.only(top: 20,left:10,right:  70),
            padding: EdgeInsets.all(70),
            child: Container(
              color: Colors.red,
              child: Text("Padding的子组件"),
            )
          )
        )
      )
    );
  }
}