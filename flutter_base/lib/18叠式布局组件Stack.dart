import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  List<Widget> getList() {
    return List.generate(10, (index) {
      return Container(width: 100, height: 100, color: Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("app bar"), centerTitle: true),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Stack(
            children: [
              Container(width: 200, height: 200, color: Colors.yellow),
              Positioned(
                left: 100,
                top: 100,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          //Stack 基础用法
          // child: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Container(width: 600, height: 700, color: Colors.yellow),
          //     Container(width: 500, height: 500, color: Colors.green),
          //     Container(width: 400, height: 400, color: Colors.black),
          //     Container(width: 300, height: 600, color: Colors.red),
          //   ],
          // ),
        ),
      ),
    );
  }
}
