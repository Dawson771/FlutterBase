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
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: List.generate(100, (index) {
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      "我是第${index + 1}个",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpTo(0);
                  //点击事件
                },
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text("去顶部", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // _controller.jumpTo(_controller.position.maxScrollExtent);//直接跳转
                  print("获取最大滚动距离：${_controller.position.maxScrollExtent}");
                  _controller.animateTo(
                    //动画滚动到指定位置
                    _controller.position.maxScrollExtent,
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                  );
                  // print("去底部");
                  //点击事件
                },
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),

                  child: Text("去底部", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: List.generate(100, (index) {
        //       return Container(
        //         margin: EdgeInsets.only(top: 20),
        //         color: Colors.blue,
        //         alignment: Alignment.center,
        //         child: Text(
        //           "我是第${index + 1}个",
        //           style: TextStyle(fontSize: 20, color: Colors.white),
        //         ),
        //       );
        //     }),
        //   ),
        //   // children: [
        //   //   Container(
        //   //     margin: EdgeInsets.only(top: 20),
        //   //     color: Colors.blue,
        //   //     alignment: Alignment.center,
        //   //     child: Text(
        //   //       "我是第一个",
        //   //       style: TextStyle(fontSize: 20, color: Colors.white),
        //   //     ),
        //   //   ),
        //   // ],
        // ),
      ),
    );
  }
}
