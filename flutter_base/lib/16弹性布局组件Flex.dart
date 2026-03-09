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
          child:Flex(
            direction:Axis.horizontal,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
              )),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
              ))
              
              
            ],
          )
          )
        )
    );
  }
}