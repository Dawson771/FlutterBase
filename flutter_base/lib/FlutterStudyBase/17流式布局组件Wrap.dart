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
          // alignment: Alignment.center,
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: getList(),
          ),
        ),
      ),
    );
  }
}
