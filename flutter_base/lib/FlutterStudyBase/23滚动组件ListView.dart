import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TextEditingController _phoneController = TextEditingController(); //创建账号控制器
  // TextEditingController _pwdController = TextEditingController();
  ScrollController _controller = ScrollController(); //创建控制器
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("滚动组件")),
        body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return Container(
              // margin: EdgeInsets.only(top: 10),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "我是第${index + 1}个",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return Container(height: 10, color: Colors.red);
          },
          itemCount: 100,
        ),
        // body: ListView.builder(
        //   itemCount: 100,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       margin: EdgeInsets.only(top: 10),
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text(
        //         "我是第${index + 1}个",
        //         style: TextStyle(fontSize: 20, color: Colors.white),
        //       ),
        //     );
        //   },
        // ),
        // body: ListView(
        //   controller: _controller,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       margin: EdgeInsets.only(top: 20),
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text(
        //         "我是第${index + 1}个",
        //         style: TextStyle(fontSize: 20, color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }
}
