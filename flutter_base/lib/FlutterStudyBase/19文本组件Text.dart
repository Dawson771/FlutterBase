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
          child: Text.rich(
            TextSpan(
              text: "hello ",
              children: [
                TextSpan(
                  text: "world",
                  style: TextStyle(fontSize: 50, color: Colors.green),
                ),
                TextSpan(text: "!", style: TextStyle(fontSize: 50)),
              ],

              style: TextStyle(
                fontSize: 50,
                color: Colors.red,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          // child: Text(
          //   "hello aljdljel知识的匮乏吉林省地方啊大家分厘卡啊的客服经理打卡机覅欧文回复你滤镜离开阿里看大家分厘卡机饿哦i附近的绿农积分",
          //   style: TextStyle(
          //     fontSize: 50,
          //     color: Colors.blue,
          //     fontStyle: FontStyle.italic,
          //     decoration: TextDecoration.underline,
          //     decorationColor: Colors.red,
          //   ),
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ),
      ),
    );
  }
}
