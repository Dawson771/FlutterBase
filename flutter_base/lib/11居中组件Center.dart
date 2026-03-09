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
          title: Text("center 示例"),
          centerTitle: true,
        ),
        body:Center(
          child: Container(
            // alignment: Alignment.center,
            color: const Color.fromARGB(255, 8, 82, 143),
            width: 200,
            height: 200,
            child: Center(
              child: Text("center",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          )
          

        )
      )
    );
  }
}