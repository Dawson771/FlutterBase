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
        body: GridView.builder(
          padding: EdgeInsets.all(10),

          // 按照最大宽度去固定
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          // 按照列数去固定
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 4,
          //   mainAxisSpacing: 10,
          //   crossAxisSpacing: 10,
          // ),
          itemCount: 100,
          itemBuilder: (BuildContext context, index) {
            return Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "我是第${index + 1}个",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
        // body: GridView.extent(
        //   padding: EdgeInsets.all(10),
        //   maxCrossAxisExtent: 400,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text(
        //         "我是第${index + 1}个",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),

        // body: GridView.count(
        //   padding: EdgeInsets.all(10),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   crossAxisCount: 3,
        //   children: List.generate(100, (index) {
        //     return Container(
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text(
        //         "我是第${index + 1}个",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }
}
