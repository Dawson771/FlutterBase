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
          transform: Matrix4.rotationZ(0.05),//弧度  旋转 非角度
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.yellow,width: 5),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Text("Hello Container",style: TextStyle(color: Colors.white,fontSize: 20)),
        )
      )
    );
  }
}