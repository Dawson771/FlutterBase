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
       
        body:Container(
          // alignment: Alignment.center,
          color: Colors.yellow,   
          child:Align(    //父组件     //Align也会继承父组件的alignment属性
            widthFactor: 2,
            heightFactor: 4,
            alignment: Alignment.centerRight,
            child: Icon(Icons.star, size :10,color: Colors.red,)//子组件
        )
        )
      )
    );
  }
}