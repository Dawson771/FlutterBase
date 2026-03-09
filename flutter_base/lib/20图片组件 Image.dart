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
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Image.network(
            "https://lf-flow-web-cdn.doubao.com/obj/flow-doubao/samantha/logo-icon-white-bg.png",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          // child: Image.asset(
          //   "lib/images/github.jpg",
          //   width: 200,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
